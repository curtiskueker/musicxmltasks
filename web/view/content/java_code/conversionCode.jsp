<div class="content-header">Conversion Code</div>

<div class="content-section">MusicXML to Java Beans</div>

<div class="content-subsection">Handlers</div>

<div class="content">
When converting from MusicXML to Java beans, a series of handler classes are called.
The handlers iterate the XML document, calling a series of nested handlers reflecting the hierarchical nature of the document,
and creating the Java beans structure along the way.
</div>

<div class="content">
The Score is first created by the ScoreHandler:
</div>

<div class="content">
    <textarea class="example" readonly rows="49">
package org.curtis.musicxml.handler;

import org.curtis.musicxml.score.PartListItem;
import org.curtis.musicxml.score.Score;
import org.curtis.musicxml.score.ScorePart;
import org.curtis.util.StringUtil;
import org.curtis.xml.XmlUtil;
import org.w3c.dom.Element;

import java.util.List;

public class ScoreHandler {
    private Score score;

    public ScoreHandler() {

    }

    public Score getScore() {
        return score;
    }

    public void handle(Element element) {
        score = new Score();

        // handle the score header
        ScoreHeaderHandler scoreHeaderHandler = new ScoreHeaderHandler(score.getScoreHeader());
        scoreHeaderHandler.handle(element);

        // handle the parts
        List&lt;Element> partElements = XmlUtil.getChildElements(element, "part");
        for(PartListItem partListItem : score.getScoreHeader().getPartListItems()) {
            if(partListItem instanceof ScorePart) {
                ScorePart scorePart = (ScorePart) partListItem;
                String partId = scorePart.getScorePartId();
                for (Element partElement : partElements) {
                    if (partId.equals(partElement.getAttribute("id"))) {
                        PartHandler partHandler = new PartHandler(score.getParts());
                        partHandler.handle(partElement);
                    }
                }
            }
        }

        String scoreVersion = element.getAttribute("version");
        if (StringUtil.isNotEmpty(scoreVersion)) score.setVersion(scoreVersion);
    }
}
    </textarea>
</div>

<div class="content">
From within ScoreHandler, a series of PartHandler classes create the part and its measures:
</div>

<div class="content">
    <textarea class="example" readonly rows="35">
package org.curtis.musicxml.handler;

import org.curtis.musicxml.score.Measure;
import org.curtis.musicxml.score.Part;
import org.curtis.xml.XmlUtil;
import org.w3c.dom.Element;

import java.util.List;

import static org.curtis.musicxml.util.MusicXmlUtil.DEBUG;

public class PartHandler implements ScoreElementHandler {
    private List&lt;Part> parts;

    public PartHandler(List&lt;Part> parts) {
        this.parts = parts;
    }

    public void handle(Element element) {
        Part part = new Part();

        part.setPartId(element.getAttribute("id"));
        if (DEBUG) System.err.println("Part " + part.getPartId());

        List&lt;Measure> measures = part.getMeasures();
        List&lt;Element> measureElements = XmlUtil.getChildElements(element, "measure");
        for(Element measureElement : measureElements) {
            MeasureHandler measureHandler = new MeasureHandler(measures);
            measureHandler.handle(measureElement);
        }

        parts.add(part);
    }
}
    </textarea>
</div>

<div class="content">
Then a series of MusicDataHandler classes are called from within MeasureHandler:
</div>

<div class="content">
    <textarea class="example" readonly rows="94">
package org.curtis.musicxml.handler;

import org.curtis.musicxml.factory.DirectionFactory;
import org.curtis.musicxml.factory.LinkFactory;
import org.curtis.musicxml.factory.NoteFactory;
import org.curtis.musicxml.util.TypeUtil;
import org.curtis.musicxml.score.Measure;
import org.curtis.musicxml.score.MusicData;
import org.curtis.util.MathUtil;
import org.curtis.xml.XmlUtil;
import org.w3c.dom.Element;

import java.util.List;

import static org.curtis.musicxml.util.MusicXmlUtil.DEBUG;

public class MeasureHandler implements ScoreElementHandler {
    private List&lt;Measure> measures;

    public MeasureHandler(List&lt;Measure> measures) {
        this.measures = measures;
    }

    public void handle(Element element) {
        String measureNumber = element.getAttribute("number");
        if (DEBUG) System.err.println("Measure " + measureNumber);
        Measure measure = new Measure();
        measure.setElementId(element.getAttribute("id"));
        measure.setNumber(measureNumber);
        measure.setText(element.getAttribute("text"));
        measure.setImplicit(TypeUtil.getYesNo(element.getAttribute("implicit")));
        measure.setNonControlling(TypeUtil.getYesNo(element.getAttribute("non-controlling")));
        measure.setWidth(MathUtil.newBigDecimal(element.getAttribute("width")));

        List&lt;MusicData> musicDataList = measure.getMusicDataList();
        List&lt;Element> measureSubelements = XmlUtil.getChildElements(element);

        for (Element measureSubelement : measureSubelements) {
            MusicDataHandler handler = null;
            MusicData musicData = null;
            String elementName = measureSubelement.getTagName();
            switch (elementName) {
                case "note":
                    handler = new NoteHandler();
                    break;
                case "backup":
                    handler = new BackupHandler();
                    break;
                case "forward":
                    handler = new ForwardHandler();
                    break;
                case "direction":
                    handler = new DirectionHandler();
                    break;
                case "attributes":
                    handler = new AttributesHandler();
                    break;
                case "harmony":
                    handler = new HarmonyHandler();
                    break;
                case "figured-bass":
                    musicData = NoteFactory.newFiguredBass(measureSubelement);
                    break;
                case "print":
                    handler = new PrintHandler();
                    break;
                case "sound":
                    musicData = DirectionFactory.newSound(measureSubelement);
                    break;
                case "barline":
                    handler = new BarlineHandler();
                    break;
                case "grouping":
                    handler = new GroupingHandler();
                    break;
                case "link":
                    musicData = LinkFactory.newLink(measureSubelement);
                    break;
                case "bookmark":
                    musicData = LinkFactory.newBookmark(measureSubelement);
                    break;
            }

            if (handler != null) musicData = handler.handle(measureSubelement);
            if(musicData != null) {
                musicDataList.add(musicData);
                musicData.setMeasure(measure);
            }
        }

        measures.add(measure);
    }
}
    </textarea>
</div>

<div class="content">
and so on, until the entire score document is iterated.
</div>

<div class="content">
When completed, the populated and annotated beans can then used to save to the database or to build LilyPond output.
</div>

<div class="content-subsection">Factories</div>

<div class="content">
Repetitive calls to create beans are handled by bean factories.
</div>

<div class="content">
For example, a Display bean can occur in many places throughout the structure,
so these calls are handled by the DisplayFactory:
</div>

<div class="content">
    <textarea class="example" readonly rows="40">
public class DisplayFactory {
    private DisplayFactory() {

    }

    public static Display newDisplay(Element element) {
        if (element == null) return null;

        BigDecimal defaultX = MathUtil.newBigDecimal(element.getAttribute("default-x"));
        BigDecimal defaultY = MathUtil.newBigDecimal(element.getAttribute("default-y"));
        BigDecimal relativeX = MathUtil.newBigDecimal(element.getAttribute("relative-x"));
        BigDecimal relativeY = MathUtil.newBigDecimal(element.getAttribute("relative-y"));

        if (invalidPositionValue(defaultX, "default-x")) defaultX = null;
        if (invalidPositionValue(defaultY, "default-y")) defaultY = null;
        if (invalidPositionValue(relativeX, "relative-x")) relativeX = null;
        if (invalidPositionValue(relativeY, "relative-y")) relativeY = null;

        Placement placement = FactoryUtil.enumValue(Placement.class, element.getAttribute("placement"));
        Font font = newFont(element);
        String color = element.getAttribute("color");
        Halign halign = FactoryUtil.enumValue(Halign.class, element.getAttribute("halign"));
        Valign valign = FactoryUtil.enumValue(Valign.class, element.getAttribute("valign"));

        if (defaultX == null && defaultY == null && relativeX == null && relativeY == null && placement == null && font == null && StringUtil.isEmpty(color) && halign == null && valign == null) return null;

        Display display = new Display();
        display.setDefaultX(defaultX);
        display.setDefaultY(defaultY);
        display.setRelativeX(relativeX);
        display.setRelativeY(relativeY);
        display.setPlacement(placement);
        display.setFont(font);
        display.setColor(color);
        display.setHalign(halign);
        display.setValign(valign);

        return display;
    }
    </textarea>
</div>

<div class="content-section">Java Beans to Text Output</div>

<div class="content">
Java beans are converted to text output by iterating the beans hierarchical structure
in a similar manner to XML document iteration.
</div>

<div class="content-subsection">MusicXML Builders</div>

<div class="content">
Iteration begins with a ScoreBuilder and continues through the score parts:
</div>

<div class="content">
    <textarea class="example" readonly rows="60">
public class ScoreBuilder extends LilypondBuilder {
    private Score score;
    private Map&lt;String, Integer> primaryVoiceStaves = new HashMap<>();

    public ScoreBuilder(Score score) {
        this.score = score;
    }

    public Score getScore() {
        return score;
    }

    public StringBuilder build() throws BuildException {
        // score header
        ScoreHeaderBuilder scoreHeaderBuilder = new ScoreHeaderBuilder(score.getScoreHeader());
        append(scoreHeaderBuilder.build().toString());

        // begin score
        appendStartSection("\\score {");
        appendStartSection("<<");

        List&lt;PartListItem> partListItems = score.getScoreHeader().getPartListItems();
        if(partListItems.isEmpty()) {
            throw new BuildException("Score header part list not found");
        }

        boolean scorePartFirst = partListItems.get(0) instanceof ScorePart;

        if(scorePartFirst) {
            appendStartSection("<<");
        }

        for (PartListItem partListItem : partListItems) {
            if(partListItem instanceof PartGroup) {
                PartGroup partGroup = (PartGroup)partListItem;
                Connection partGroupType = partGroup.getType();
                if (partGroupType == Connection.START) {
                    appendStartSection("\\new StaffGroup <<");
                } else if (partGroupType == Connection.STOP) {
                    appendEndSection(">>");
                }
            } else if(partListItem instanceof ScorePart) {
                ScorePart scorePart = (ScorePart)partListItem;
                appendStartSection("<<");
                buildPart(scorePart);
                appendEndSection(">>");
            }
        }

        if(scorePartFirst) {
            appendEndSection(">>");
        }

        // end score
        appendEndSection(">>");
        appendEndSection("}");

        return stringBuilder;
    }
    </textarea>
</div>

<div class="content-subsection">LilyPond Builders</div>

<div class="content">
Likewise, LilyPond iteration begins with a ScoreBuilder and continues through the score parts.
</div>

<div class="content">
The LilyPond conversion code, however, only implements a fraction of a MusicXML document into LilyPond features,
due to the richness of the MusicXML and LilyPond definitions.
The user is expected to adjust the output once the conversion is complete
    if features are noted as unimplemented, or if the conversion produces any anomalies.
</div>

<div class="content">
    LilyPond conversion fails at the measure level, so if, for example, a measure's duration count doesn't add up,
    the conversion will output a measure-length spacer for that measure, and output the exception to the console.
</div>

<div class="content">
Because there are so many possible output features and only some of them are implemented,
the Java code at the music-data level uses reflection to construct the expected builder class method call.
If the method is unimplemented, a message is sent to console output indicating the unimplemented method.
</div>

<div class="content">
    <textarea class="example" readonly rows="82">
package org.curtis.lilypond.musicdata;

import org.curtis.lilypond.LilypondBuilder;
import org.curtis.lilypond.MeasureBuilder;
import org.curtis.lilypond.exception.BuildException;
import org.curtis.lilypond.part.PartBuilder;
import org.curtis.util.MathUtil;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.curtis.musicxml.util.MusicXmlUtil.DEBUG;

public class MusicDataBuilder extends LilypondBuilder {
    private Object musicData;
    private BigDecimal unhandledDuration = MathUtil.ZERO;

    public MusicDataBuilder(Object musicData) {
        this.musicData = musicData;
    }

    public MusicDataBuilder() {

    }

    public Object getMusicData() {
        return musicData;
    }

    public BigDecimal getUnhandledDuration() {
        return unhandledDuration;
    }

    public void setUnhandledDuration(BigDecimal unhandledDuration) {
        this.unhandledDuration = unhandledDuration;
    }

    public StringBuilder build() throws BuildException {
        if (musicData == null) return stringBuilder;

        String musicDataClassName = musicData.getClass().getName();
        musicDataClassName = musicDataClassName.replace("org.curtis.musicxml.", "");

        List&lt;String> classNameParts = new ArrayList<>(Arrays.asList(musicDataClassName.split("\\.")));

        String objectClassName = classNameParts.remove(classNameParts.size() - 1);
        String builderRootClassName = classNameParts.remove(classNameParts.size() - 1);
        builderRootClassName = builderRootClassName.substring(0, 1).toUpperCase() + builderRootClassName.substring(1);
        String builderPackageName = "org.curtis.lilypond.musicdata.";

        String builderObjectName = builderRootClassName + "Builder";
        String builderClassName = builderPackageName + builderObjectName;
        String builderMethodName = "build" + objectClassName;

        try {
            Class builderClass = Class.forName(builderClassName);
            Method builderMethod = builderClass.getMethod(builderMethodName, musicData.getClass());
            append(builderMethod.invoke(builderClass.getDeclaredConstructor().newInstance(), musicData).toString());
        } catch (InvocationTargetException e) {
            if (e.getCause() instanceof BuildException) {
                // Note exception but continue anyway
                System.err.println(PartBuilder.CURRENT_PART_ID + ", Measure " + MeasureBuilder.CURRENT_MEASURE_NUMBER + ": " + e.getCause().getMessage());
                setUnhandledDuration(((BuildException)e.getCause()).getUnhandledDuration());
            } else {
                displayException(e);
                if(DEBUG) e.printStackTrace();
            }
        } catch (NoSuchMethodException e) {
            System.err.println("Unimplemented method: " + builderObjectName + "." + builderMethodName + "(" + objectClassName + ")");
        } catch (Exception e) {
            displayException(e);
            if(DEBUG) e.printStackTrace();
        }

        return stringBuilder;
    }
}
    </textarea>
</div>

<div class="content">
In this way, LilyPond output implementations can be added individually as desired,
and there's no need to add any number of empty builder methods corresponding to every possible MusicXML element.
</div>

<div class="content">
For example, the DirectiontypeBuilder implements only those methods that have direction type output implemented for LilyPond:
</div>

<div class="content">
    <textarea class="example" readonly rows="51">
public class DirectiontypeBuilder extends MusicDataBuilder {
    public DirectiontypeBuilder() {

    }

    public StringBuilder buildRehearsal(Rehearsal rehearsal) {
        append("\\mark ");
        formattedDisplayBuild(rehearsal.getDisplay(), rehearsal.getTextFormat());

        return stringBuilder;
    }

    public StringBuilder buildSegno(Segno segno) {
        append("\\segno");

        return stringBuilder;
    }

    public StringBuilder buildWords(Words words) {
        if (words.isTextMark()) append("\\mark ");
        formattedDisplayBuild(words.getDisplay(), words.getTextFormat());

        return stringBuilder;
    }

    public StringBuilder buildCoda(Coda coda) {
        appendLine("\\coda");

        return stringBuilder;
    }

    public StringBuilder buildWedge(Wedge wedge) {
        WedgeType wedgeType = wedge.getType();
        switch (wedgeType) {
            case CRESCENDO:
                append("\\<");
                break;
            case DIMINUENDO:
                append("\\>");
                break;
            case STOP:
                append("\\!");
                break;
            case INVALID:
                System.err.println("Wedge not handled");
                break;
        }
    }
    [additional methods ...]
    </textarea>
</div>

<div class="content-section">UI and Executables</div>

<div class="content">
The UI is built using JavaFX Scene Builder.
</div>

<div class="content">
Scene Builder creates the musicxmltasks.fxml file that describes the component parts, and maps interface widgets to method calls.
</div>

<div class="content">
Invoked methods are in class TasksController.
On button press, method buttonPressed() is invoked which sets up the TaskExecutor in a new thread.
</div>

<div class="content">
    <textarea class="example" readonly rows="13">
    @FXML
    private void buttonPressed(ActionEvent actionEvent) {
        taskForm.clearOutput();

        Button button = (Button)actionEvent.getSource();

        // Run task in thread
        TaskExecutor taskExecutor = new TaskExecutor(button.getId(), taskForm);
        Runnable taskRunnable = taskExecutor::execute;
        Thread formThread = new Thread(taskRunnable);
        formThread.start();
    }
    </textarea>
</div>

<div class="content">
TaskExecutor resolves which button is pressed, handles the input, calls the executable, and handles state updates in a separate thread.
</div>

<div class="content">
    <textarea class="example" readonly rows="98">
    public void execute() {
        InputHandler inputHandler = null;
        JavafxTaskInitializer taskInitializer = null;
        boolean isPropertiesSettingsUpdate = false;
        boolean isLyPdfPropertiesUpdate = false;
        boolean isDbUpdate = false;
        boolean isOutputSettingsUpdate = false;
        switch (controlId) {
            case FormNode.SAVE_DB_SETTINGS_BUTTON:
                taskInitializer = new SaveDbSettingsInitializer(taskForm);
                inputHandler = new SetDbPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                break;
            case FormNode.SAVE_LY_PDF_SETTINGS_BUTTON:
                taskInitializer = new LyPdfSettingsInitializer(taskForm);
                inputHandler = new SetLyPdfPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                isLyPdfPropertiesUpdate = true;
                break;
            case FormNode.SAVE_OUTPUT_SETTINGS_BUTTON:
                taskInitializer = new OutputSettingsInitializer(taskForm);
                inputHandler = new SetOutputPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                isOutputSettingsUpdate = true;
                break;
            case FormNode.EXECUTE_DB_ACTIONS_BUTTON:
                taskInitializer = new DbTablesInitializer(taskForm);
                inputHandler = new DatabaseHandler();
                break;
            case FormNode.EXECUTE_VALIDATE_BUTTON:
                taskInitializer = new ValidateXmlInitializer(taskForm);
                inputHandler = new ValidateXmlHandler();
                break;
            case FormNode.EXECUTE_CONVERT_BUTTON:
                taskInitializer = new ConvertInitializer(taskForm);
                switch (taskForm.getFromSelection()) {
                    case TaskConstants.CONVERSION_TYPE_MUSICXML:
                        switch (taskForm.getToSelection()) {
                            case TaskConstants.CONVERSION_TYPE_DATABASE:
                                inputHandler = new MusicXml2DbHandler();
                                isDbUpdate = true;
                                break;
                            case TaskConstants.CONVERSION_TYPE_LILYPOND:
                                inputHandler = new MusicXml2LyHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_PDF:
                                inputHandler = new MusicXml2PdfHandler();
                                break;
                        }
                        break;
                    case TaskConstants.CONVERSION_TYPE_DATABASE:
                        switch (taskForm.getToSelection()) {
                            case TaskConstants.CONVERSION_TYPE_MUSICXML:
                                inputHandler = new Db2MusicXmlHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_LILYPOND:
                                inputHandler = new Db2LyHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_PDF:
                                inputHandler = new Db2PdfHandler();
                                break;
                        }
                        break;
                    case TaskConstants.CONVERSION_TYPE_LILYPOND:
                        if (TaskConstants.CONVERSION_TYPE_PDF.equals(taskForm.getToSelection())) {
                            inputHandler = new Ly2PdfHandler();
                        }
                        break;
                }
                break;
            case FormNode.EXECUTE_DELETE_BUTTON:
                taskInitializer = new DeleteScoreInitializer(taskForm);
                inputHandler = new DeleteScoreHandler();
                isDbUpdate = true;
                break;
        }

        try {
            if (taskInitializer != null && inputHandler != null) {
                taskForm.disableNodes(true);
                taskInitializer.initializeNodeMap();
                MusicXmlTask musicXmlTask = new MusicXmlTask(taskInitializer, inputHandler);
                musicXmlTask.execute();

                if (isPropertiesSettingsUpdate) Platform.runLater(PropertiesHandler::addLocalPropertiesBundle);
                if (isLyPdfPropertiesUpdate) Platform.runLater(() -> taskForm.handleLyPdfUpdates());
                if (isDbUpdate) Platform.runLater(() -> {taskForm.handleDisplayUpdates();});
                if (isOutputSettingsUpdate) Platform.runLater(() -> taskForm.resetOutputStream());
            }
            System.err.println("Task finished successfully");
        } catch (TaskException e) {
            System.err.println("Task exited with exception");
            System.err.println(e.getMessage());
        } finally {
            taskForm.disableNodes(false);
        }
    }
    </textarea>
</div>

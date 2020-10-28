<div class="content-header">The Java bean object model</div>

<div class="content">
    A Java bean is a class consisting of a zero-argument constructor and zero or more data members (attributes).
    Each attribute has an accompanying pair of get and set methods to manipulate attribute values.
</div>

<div class="content">
    The consistent form of a Java bean allows it to be used by a framework which expects bean classes to be in a predictable form.
    The framework used in the tasks application is the Hibernate object-relational mapping tool.
</div>

<div class="content-section">Translating from schema to bean</div>

<div class="content">
    Each tasks application Java bean is a translation of some part of the MusicXML schema.
</div>

<div class="content">
    Once the schema has been translated to Java beans, each bean entity then maps to a database table,
    and the bean attributes map to columns in the table using Hibernate annotations.
</div>

<div class="content">
    The process of translating a schema to a Java objects here is a standard one.
</div>

<div class="content">
    In general, these translations are:
    <ul>
        <li>An element, or a <code>group</code> or <code>complexType</code> definition of an element is a bean</li>
        <li>Element text, an element attribute, or an element defined by a <code>simpleType</code> or scalar value is a bean attribute</li>
        <li>An <code>attributeGroup</code> or a <code>simpleContent</code> is a collection of bean attributes</li>
        <li>A <code>choice</code> is an abstract superclass with each item in the <code>choice</code> a concrete Java bean subclass of the abstract class</li>
        <li>An <code>enumeration</code> is a Java enum whose value is a bean attribute</li>
    </ul>
</div>

<div class="content-section">Bean examples</div>

<div class="content-subsection"><code>measure</code> and <code>music-data</code></div>

<div class="content">
    The <code>measure</code> element in the MusicXML schema is defined as:
</div>

<div class="content">
<textarea class="example" readonly rows="16">
<xs:element name="measure" maxOccurs="unbounded">
    <xs:complexType>
        <xs:group ref="music-data"/>
        <xs:attributeGroup ref="measure-attributes"/>
    </xs:complexType>
</xs:element>

<xs:attributeGroup name="measure-attributes">
    <xs:attribute name="number" type="xs:token" use="required"/>
    <xs:attribute name="text" type="measure-text"/>
    <xs:attribute name="implicit" type="yes-no"/>
    <xs:attribute name="non-controlling" type="yes-no"/>
    <xs:attribute name="width" type="tenths"/>
    <xs:attributeGroup ref="optional-unique-id"/>
</xs:attributeGroup>
</textarea>
</div>

<div class="content">
The <code>measure</code> element translates to a Measure bean, and the <code>attributeGroup</code> <code>measure-attributes</code> translate to a collection of bean attributes.
</div>

<div class="content">
The Measure bean is thus defined as follows:
</div>

<div class="content">
<textarea class="example" readonly rows="67">
package org.curtis.musicxml.score;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Measure extends OrderedElement {
    private String number;
    private String text;
    private Boolean implicit;
    private Boolean nonControlling;
    private BigDecimal width;
    private List&lt;MusicData> musicDataList = new ArrayList<>();

    public Measure() {

    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getImplicit() {
        return implicit;
    }

    public void setImplicit(Boolean implicit) {
        this.implicit = implicit;
    }

    public Boolean getNonControlling() {
        return nonControlling;
    }

    public void setNonControlling(Boolean nonControlling) {
        this.nonControlling = nonControlling;
    }

    public BigDecimal getWidth() {
        return width;
    }

    public void setWidth(BigDecimal width) {
        this.width = width;
    }

    public List&lt;MusicData> getMusicDataList() {
        return musicDataList;
    }

    public void setMusicDataList(List&lt;MusicData> musicDataList) {
        this.musicDataList = musicDataList;
    }
}
</textarea>
</div>

<div class="content">
The <code>music-data</code> group referenced within the <code>measure</code> element definition is defined as a list of a
    <code>choice</code> subelements of the <code>measure</code> element.
</div>

<div class="content">
    <textarea class="example" readonly rows="20">
<xs:group name="music-data">
    <xs:sequence>
        <xs:choice minOccurs="0" maxOccurs="unbounded">
            <xs:element name="note" type="note"/>
            <xs:element name="backup" type="backup"/>
            <xs:element name="forward" type="forward"/>
            <xs:element name="direction" type="direction"/>
            <xs:element name="attributes" type="attributes"/>
            <xs:element name="harmony" type="harmony"/>
            <xs:element name="figured-bass" type="figured-bass"/>
            <xs:element name="print" type="print"/>
            <xs:element name="sound" type="sound"/>
            <xs:element name="barline" type="barline"/>
            <xs:element name="grouping" type="grouping"/>
            <xs:element name="link" type="link"/>
            <xs:element name="bookmark" type="bookmark"/>
        </xs:choice>
    </xs:sequence>
</xs:group>
    </textarea>
</div>

<div class="content">
The <code>choice</code> construct itself is an abstract superclass,
while the individual elements within the <code>choice</code> are each concrete subclasses of the abstract class.
</div>

<div class="content">
The MusicData class represents the <code>choice</code> element:
</div>

<div class="content">
    <textarea class="example" readonly rows="8">
package org.curtis.musicxml.score;

import org.curtis.database.OrderedItem;

public abstract class MusicData extends OrderedItem {

}
    </textarea>
</div>

<div class="content">
The <code>note</code> element (to take an example) is one of the <code>choice</code> options, and translates to the Note subclass
    [class MusicDataElement is a subclass of MusicData that includes <code>optional-unique-id</code>]:
</div>

<div class="content">
    <textarea class="example" readonly rows="307">
package org.curtis.musicxml.note;

import org.curtis.lilypond.util.TypeUtil;
import org.curtis.musicxml.common.SymbolSize;
import org.curtis.musicxml.display.TextDisplay;
import org.curtis.musicxml.display.Editorial;
import org.curtis.musicxml.common.Printout;
import org.curtis.musicxml.common.play.Play;
import org.curtis.musicxml.display.Display;
import org.curtis.musicxml.note.lyric.Lyric;
import org.curtis.musicxml.score.MusicDataElement;
import org.curtis.util.MathUtil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Note extends MusicDataElement {
    private Grace grace;
    private Boolean cue = false;
    private NoteType noteType;
    private Boolean chord = false;
    private BigDecimal duration = MathUtil.ZERO;
    private List&lt;Tie> ties = new ArrayList&lt;>();
    private String instrument;
    private Editorial editorial;
    private String voice;
    private NoteTypeValue noteValue;
    private SymbolSize noteSize;
    private List&lt;Dot> dots = new ArrayList&lt;>();
    private Accidental accidental;
    private TimeModification timeModification;
    private Stem stem;
    private Notehead notehead;
    private List&lt;TextDisplay> noteheadTextList = new ArrayList&lt;>();
    private Integer staff;
    private List&lt;Beam> beams = new ArrayList&lt;>();
    private List&lt;Notations> notationsList = new ArrayList&lt;>();
    private List&lt;Lyric> lyrics = new ArrayList&lt;>();
    private Play play;
    private Display display;
    private Printout printout;
    private Boolean printLeger;
    private BigDecimal dynamics;
    private BigDecimal endDynamics;
    private BigDecimal attack;
    private BigDecimal release;
    private String timeOnly;
    private Boolean pizzicato;

    public Note() {

    }

    public Grace getGrace() {
        return grace;
    }

    public void setGrace(Grace grace) {
        this.grace = grace;
    }

    public boolean isGraceNote() {
        return grace != null;
    }

    public Boolean getCue() {
        return cue;
    }

    public void setCue(Boolean cue) {
        this.cue = cue;
    }

    public NoteType getNoteType() {
        return noteType;
    }

    public void setNoteType(NoteType noteType) {
        this.noteType = noteType;
    }

    public Boolean isChord() {
        return chord;
    }

    public void setChord(Boolean chord) {
        this.chord = chord;
    }

    public BigDecimal getDuration() {
        return duration;
    }

    public void setDuration(BigDecimal duration) {
        this.duration = duration;
    }

    public List&lt;Tie> getTies() {
        return ties;
    }

    public void setTies(List&lt;Tie> ties) {
        this.ties = ties;
    }

    public String getInstrument() {
        return instrument;
    }

    public void setInstrument(String instrument) {
        this.instrument = instrument;
    }

    public Editorial getEditorial() {
        return editorial;
    }

    public void setEditorial(Editorial editorial) {
        this.editorial = editorial;
    }

    public String getVoice() {
        return voice;
    }

    public void setVoice(String voice) {
        this.voice = voice;
    }

    public NoteTypeValue getNoteValue() {
        return noteValue;
    }

    public void setNoteValue(NoteTypeValue noteValue) {
        this.noteValue = noteValue;
    }

    public SymbolSize getNoteSize() {
        return noteSize;
    }

    public void setNoteSize(SymbolSize noteSize) {
        this.noteSize = noteSize;
    }

    public List&lt;Dot> getDots() {
        return dots;
    }

    public void setDots(List&lt;Dot> dots) {
        this.dots = dots;
    }

    public Accidental getAccidental() {
        return accidental;
    }

    public void setAccidental(Accidental accidental) {
        this.accidental = accidental;
    }

    public TimeModification getTimeModification() {
        return timeModification;
    }

    public void setTimeModification(TimeModification timeModification) {
        this.timeModification = timeModification;
    }

    public Stem getStem() {
        return stem;
    }

    public void setStem(Stem stem) {
        this.stem = stem;
    }

    public Notehead getNotehead() {
        return notehead;
    }

    public void setNotehead(Notehead notehead) {
        this.notehead = notehead;
    }

    public List&lt;TextDisplay> getNoteheadTextList() {
        return noteheadTextList;
    }

    public void setNoteheadTextList(List&lt;TextDisplay> noteheadTextList) {
        this.noteheadTextList = noteheadTextList;
    }

    public Integer getStaff() {
        return staff;
    }

    public void setStaff(Integer staff) {
        this.staff = staff;
    }

    public List&lt;Beam> getBeams() {
        return beams;
    }

    public void setBeams(List&lt;Beam> beams) {
        this.beams = beams;
    }

    public List&lt;Notations> getNotationsList() {
        return notationsList;
    }

    public void setNotationsList(List&lt;Notations> notationsList) {
        this.notationsList = notationsList;
    }

    public List&lt;Lyric> getLyrics() {
        return lyrics;
    }

    public void setLyrics(List&lt;Lyric> lyrics) {
        this.lyrics = lyrics;
    }

    public Play getPlay() {
        return play;
    }

    public void setPlay(Play play) {
        this.play = play;
    }

    public Display getDisplay() {
        return display;
    }

    public void setDisplay(Display display) {
        this.display = display;
    }

    public Printout getPrintout() {
        return printout;
    }

    public void setPrintout(Printout printout) {
        this.printout = printout;
    }

    public Boolean getPrintLeger() {
        return printLeger;
    }

    public void setPrintLeger(Boolean printLeger) {
        this.printLeger = printLeger;
    }

    public BigDecimal getDynamics() {
        return dynamics;
    }

    public void setDynamics(BigDecimal dynamics) {
        this.dynamics = dynamics;
    }

    public BigDecimal getEndDynamics() {
        return endDynamics;
    }

    public void setEndDynamics(BigDecimal endDynamics) {
        this.endDynamics = endDynamics;
    }

    public BigDecimal getAttack() {
        return attack;
    }

    public void setAttack(BigDecimal attack) {
        this.attack = attack;
    }

    public BigDecimal getRelease() {
        return release;
    }

    public void setRelease(BigDecimal release) {
        this.release = release;
    }

    public String getTimeOnly() {
        return timeOnly;
    }

    public void setTimeOnly(String timeOnly) {
        this.timeOnly = timeOnly;
    }

    public Boolean getPizzicato() {
        return pizzicato;
    }

    public void setPizzicato(Boolean pizzicato) {
        this.pizzicato = pizzicato;
    }
}
    </textarea>
</div>

<div class="content-subsection">metronome</div>

<div class="content">
A less straightforward example of a translation of a choice is the metronome complexType.
</div>

<div class="content">
When a choice has an unnamed sequence, I translate the sequence to a bean subclass using a name that I feel represents the sequence.
</div>

<div class="content">
The metronome complexType is defined as follows:
</div>

<div class="content">
<textarea class="example" readonly rows="30">
<xs:complexType name="metronome">
    <xs:choice>
        <xs:sequence>
            <xs:group ref="beat-unit"/>
            <xs:element name="beat-unit-tied" type="beat-unit-tied" minOccurs="0" maxOccurs="unbounded"/>
            <xs:choice>
                <xs:element name="per-minute" type="per-minute"/>
                <xs:sequence>
                    <xs:group ref="beat-unit"/>
                    <xs:element name="beat-unit-tied" type="beat-unit-tied" minOccurs="0" maxOccurs="unbounded"/>
                </xs:sequence>
            </xs:choice>
        </xs:sequence>
        <xs:sequence>
            <xs:element name="metronome-arrows" type="empty" minOccurs="0">
            </xs:element>
            <xs:element name="metronome-note" type="metronome-note" maxOccurs="unbounded"/>
            <xs:sequence minOccurs="0">
                <xs:element name="metronome-relation" type="xs:string">
                </xs:element>
                <xs:element name="metronome-note" type="metronome-note" maxOccurs="unbounded"/>
            </xs:sequence>
        </xs:sequence>
    </xs:choice>
    <xs:attributeGroup ref="print-style-align"/>
    <xs:attributeGroup ref="justify"/>
    <xs:attribute name="parentheses" type="yes-no"/>
    <xs:attributeGroup ref="optional-unique-id"/>
</xs:complexType>
</textarea>
</div>

<div class="content">
The Metronome abstract class is the translation of the metronome complexType as a whole:
</div>

<div class="content">
<textarea class="example" readonly rows="26">
package org.curtis.musicxml.direction.directiontype.metronome;

import org.curtis.musicxml.direction.directiontype.DirectionType;
import org.curtis.musicxml.display.Halign;

public abstract class Metronome extends DirectionType {
    private Halign justify;
    private Boolean parentheses;

    public Halign getJustify() {
        return justify;
    }

    public void setJustify(Halign justify) {
        this.justify = justify;
    }

    public Boolean getParentheses() {
        return parentheses;
    }

    public void setParentheses(Boolean parentheses) {
        this.parentheses = parentheses;
    }
}
</textarea>
</div>

<div class="content">
The Java beans BeatMetronome and NoteMetronome are concrete subclasses of Metronome,
where each bean type is a translation of one of the sequence elements in the choice.
</div>

<div class="content">
The NoteMetronome bean is the translation of the second sequence:
</div>

<div class="content">
<textarea class="example" readonly rows="49">
package org.curtis.musicxml.direction.directiontype.metronome;

import java.util.ArrayList;
import java.util.List;

public class NoteMetronome extends Metronome {
    private Boolean metronomeArrows = false;
    private List&lt;MetronomeNote> metronomeNotes1 = new ArrayList&lt;>();
    private String metronomeRelation;
    private List&lt;MetronomeNote> metronomeNotes2 = new ArrayList&lt;>();

    public NoteMetronome() {

    }

    public Boolean getMetronomeArrows() {
        return metronomeArrows;
    }

    public void setMetronomeArrows(Boolean metronomeArrows) {
        this.metronomeArrows = metronomeArrows;
    }

    public List&lt;MetronomeNote> getMetronomeNotes1() {
        return metronomeNotes1;
    }

    public void setMetronomeNotes1(List&lt;MetronomeNote> metronomeNotes1) {
        this.metronomeNotes1 = metronomeNotes1;
    }

    public String getMetronomeRelation() {
        return metronomeRelation;
    }

    public void setMetronomeRelation(String metronomeRelation) {
        this.metronomeRelation = metronomeRelation;
    }

    public List&lt;MetronomeNote> getMetronomeNotes2() {
        return metronomeNotes2;
    }

    public void setMetronomeNotes2(List&lt;MetronomeNote> metronomeNotes2) {
        this.metronomeNotes2 = metronomeNotes2;
    }

}
</textarea>
</div>

<div class="content">
The BeatMetronome bean is the translation of the first sequence, reproduced below:
</div>

<div class="content">
<textarea class="example" readonly rows="12">
<xs:sequence>
    <xs:group ref="beat-unit"/>
    <xs:element name="beat-unit-tied" type="beat-unit-tied" minOccurs="0" maxOccurs="unbounded"/>
    <xs:choice>
        <xs:element name="per-minute" type="per-minute"/>
        <xs:sequence>
            <xs:group ref="beat-unit"/>
            <xs:element name="beat-unit-tied" type="beat-unit-tied" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:choice>
</xs:sequence>
</textarea>
</div>

<div class="content">
The choice section within the sequence is translated as abstract class MetronomeMark,
with two concrete subclasses PerMinute and BeatUnit; BeatUnit represents the beat-unit/beat-unit-tied sequence.
</div>

<div class="content">
<textarea class="example" readonly rows="29">
package org.curtis.musicxml.direction.directiontype.metronome;

import org.curtis.musicxml.display.Display;

public class PerMinute extends MetronomeMark {
    private String value;
    private Display display;

    public PerMinute() {

    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Display getDisplay() {
        return display;
    }

    public void setDisplay(Display display) {
        this.display = display;
    }
}
</textarea>
</div>

<div class="content">
<textarea class="example" readonly rows="41">
package org.curtis.musicxml.direction.directiontype.metronome;

import org.curtis.musicxml.note.NoteTypeValue;

import java.util.ArrayList;
import java.util.List;

public class BeatUnit extends MetronomeMark {
    private NoteTypeValue value;
    private Integer beatUnitDots = 0;
    private List&lt;BeatUnit> beatUnitTieds = new ArrayList&lt;>();

    public BeatUnit() {

    }

    public NoteTypeValue getValue() {
        return value;
    }

    public void setValue(NoteTypeValue value) {
        this.value = value;
    }

    public Integer getBeatUnitDots() {
        return beatUnitDots;
    }

    public void setBeatUnitDots(Integer beatUnitDots) {
        this.beatUnitDots = beatUnitDots;
    }

    public List&lt;BeatUnit> getBeatUnitTieds() {
        return beatUnitTieds;
    }

    public void setBeatUnitTieds(List&lt;BeatUnit> beatUnitTieds) {
        this.beatUnitTieds = beatUnitTieds;
    }
}
</textarea>
</div>

<div class="content">
The BeatMetronome sequence as a whole is then translated as two MetronomeMark attributes:
</div>

<div class="content">
<textarea class="example" readonly rows="27">
package org.curtis.musicxml.direction.directiontype.metronome;

public class BeatMetronome extends Metronome {
    private MetronomeMark metronomeMark1;
    private MetronomeMark metronomeMark2;

    public BeatMetronome() {

    }

    public MetronomeMark getMetronomeMark1() {
        return metronomeMark1;
    }

    public void setMetronomeMark1(MetronomeMark metronomeMark1) {
        this.metronomeMark1 = metronomeMark1;
    }

    public MetronomeMark getMetronomeMark2() {
        return metronomeMark2;
    }

    public void setMetronomeMark2(MetronomeMark metronomeMark2) {
        this.metronomeMark2 = metronomeMark2;
    }
}
</textarea>
</div>

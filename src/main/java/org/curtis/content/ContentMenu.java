package org.curtis.content;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContentMenu {
    private static final MenuItem MENU;

    private static Map<String, MenuItem> MENU_MAP;
    private static final String DEFAULT_PAGE_NUMBER = "1";

    static {
        MENU = new MenuItem(
                Arrays.asList(
                        new MenuItem("Outline", "outline.jsp"),
                        new MenuItem("Tasks Interface", "interface/tasksInterface.jsp",
                                Arrays.asList(
                                        new MenuItem("Tasks Tabs", "interface/tasksTabs.jsp",
                                                Arrays.asList(
                                                        new MenuItem("Convert", "interface/convert/convert.jsp",
                                                                Arrays.asList(
                                                                        new MenuItem("From MusicXML", "interface/convert/fromMusicXml.jsp"),
                                                                        new MenuItem("From Database", "interface/convert/fromDb.jsp"),
                                                                        new MenuItem("From LilyPond", "interface/convert/fromLy.jsp"),
                                                                        new MenuItem("To MusicXML", "interface/convert/toMusicXml.jsp"),
                                                                        new MenuItem("To Database", "interface/convert/toDb.jsp"),
                                                                        new MenuItem("To LilyPond", "interface/convert/toLy.jsp"),
                                                                        new MenuItem("To PDF", "interface/convert/toPdf.jsp")
                                                                )
                                                        ),
                                                        new MenuItem("Validate/Compress XML", "interface/validate.jsp"),
                                                        new MenuItem("DB Settings", "interface/dbSettings.jsp"),
                                                        new MenuItem("LilyPond/PDF", "interface/lilypondPdf.jsp"),
                                                        new MenuItem("Output", "interface/output.jsp"),
                                                        new MenuItem("DB Actions", "interface/dbActions.jsp")
                                                )
                                        ),
                                        new MenuItem("Tasks Output", "interface/tasksOutput.jsp")
                                )
                        ),
                        new MenuItem("Database Layout", "database/layout.jsp",
                                Arrays.asList(
                                        new MenuItem("Score", "database/score.jsp"),
                                        new MenuItem("Score Header", "database/scoreHeader.jsp"),
                                        new MenuItem("Music Data", "database/musicData.jsp",
                                                Arrays.asList(
                                                        new MenuItem("Note", "database/note.jsp"),
                                                        new MenuItem("Backup/Forward", "database/backupForward.jsp"),
                                                        new MenuItem("Direction", "database/direction.jsp"),
                                                        new MenuItem("Attributes", "database/attributes.jsp"),
                                                        new MenuItem("Harmony", "database/harmony.jsp"),
                                                        new MenuItem("Figured Bass", "database/figuredBass.jsp"),
                                                        new MenuItem("Print", "database/print.jsp"),
                                                        new MenuItem("Sound", "database/sound.jsp"),
                                                        new MenuItem("Barline", "database/barline.jsp"),
                                                        new MenuItem("Grouping", "database/grouping.jsp"),
                                                        new MenuItem("Link/Bookmark", "database/linkBookmark.jsp")
                                                )
                                        ),
                                        new MenuItem("Notation", "database/notation.jsp",
                                                Arrays.asList(
                                                        new MenuItem("Ornaments", "database/ornaments.jsp"),
                                                        new MenuItem("Technicals", "database/technicals.jsp"),
                                                        new MenuItem("Articulations", "database/articulations.jsp")
                                                )
                                        ),
                                        new MenuItem("Formatted Display", "database/formattedDisplay.jsp"),
                                        Tables.getTableReference()
                                )
                        ),
                        new MenuItem("Database Setup", "db_setup/dbSetup.jsp"),
                        new MenuItem("Using the Database", "db_use/scoreView.jsp",
                                Arrays.asList(
                                        new MenuItem("Stored Procedures", "db_use/storedProcedures.jsp"),
                                        new MenuItem("Functions", "db_use/functions.jsp"),
                                        new MenuItem("Reports", "db_use/reports.jsp",
                                                Arrays.asList(
                                                        new MenuItem("Pitch Count Report", "db_use/pitchCountReport.jsp"),
                                                        new MenuItem("Interval Count Report", "db_use/intervalCountReport.jsp"),
                                                        new MenuItem("Measure Notes Report", "db_use/measureNotesReport.jsp")
                                                )
                                        )
                                )
                        ),
                        new MenuItem("Java Code", "java_code/codeOverview.jsp",
                                Arrays.asList(
                                        new MenuItem("Java Beans", "java_code/beans.jsp"),
                                        new MenuItem("Hibernate Annotations", "java_code/hibernate.jsp"),
                                        new MenuItem("Conversion Code", "java_code/conversionCode.jsp"),
                                        new MenuItem("UI and Executables", "java_code/uiExecutables.jsp"),
                                        new MenuItem("Javadoc", "java_code/javadoc.jsp")
                                )
                        ),
                        new MenuItem("Command-line Scripts", "scripts/scripts.jsp",
                                Arrays.asList(
                                        new MenuItem("Linux", "scripts/linux/linuxScripts.jsp",
                                                Arrays.asList(
                                                        new MenuItem("db2Ly", "scripts/linux/db2Ly.jsp"),
                                                        new MenuItem("db2MusicXml", "scripts/linux/db2MusicXml.jsp"),
                                                        new MenuItem("db2Pdf", "scripts/linux/db2Pdf.jsp"),
                                                        new MenuItem("ly2Pdf", "scripts/linux/ly2Pdf.jsp"),
                                                        new MenuItem("musicXml2Db", "scripts/linux/musicXml2Db.jsp"),
                                                        new MenuItem("musicXml2Ly", "scripts/linux/musicXml2Ly.jsp"),
                                                        new MenuItem("musicXml2Pdf", "scripts/linux/musicXml2Pdf.jsp"),
                                                        new MenuItem("musicXmlCompress", "scripts/linux/musicXmlCompress.jsp"),
                                                        new MenuItem("musicXmlDiff", "scripts/linux/musicXmlDiff.jsp"),
                                                        new MenuItem("musicXmlProcess", "scripts/linux/musicXmlProcess.jsp"),
                                                        new MenuItem("musicXmlValidate", "scripts/linux/musicXmlValidate.jsp")
                                                )
                                        ),
                                        new MenuItem("Windows", "scripts/windows/windowsScripts.jsp",
                                                Arrays.asList(
                                                        new MenuItem("db2Ly", "scripts/windows/db2Ly.jsp"),
                                                        new MenuItem("db2MusicXml", "scripts/windows/db2MusicXml.jsp"),
                                                        new MenuItem("db2Pdf", "scripts/windows/db2Pdf.jsp"),
                                                        new MenuItem("ly2Pdf", "scripts/windows/ly2Pdf.jsp"),
                                                        new MenuItem("musicXml2Db", "scripts/windows/musicXml2Db.jsp"),
                                                        new MenuItem("musicXml2Ly", "scripts/windows/musicXml2Ly.jsp"),
                                                        new MenuItem("musicXml2Pdf", "scripts/windows/musicXml2Pdf.jsp"),
                                                        new MenuItem("musicXmlCompress", "scripts/windows/musicXmlCompress.jsp"),
                                                        new MenuItem("musicXmlDiff", "scripts/windows/musicXmlDiff.jsp"),
                                                        new MenuItem("musicXmlProcess", "scripts/windows/musicXmlProcess.jsp"),
                                                        new MenuItem("musicXmlValidate", "scripts/windows/musicXmlValidate.jsp")
                                                )
                                        )
                                )
                        ),
                        new MenuItem("Download and Install", "download/download.jsp",
                                Arrays.asList(
                                        new MenuItem("Windows", "download/windows.jsp"),
                                        new MenuItem("Linux", "download/linux.jsp")
                                )
                        )
                )
        );
    }

    private ContentMenu() {

    }

    public static synchronized MenuItem getMenu() {
        if (MENU_MAP == null) initializeMenuMap();

        return MENU;
    }

    private static void initializeMenuMap() {
        MENU_MAP = new HashMap<>();

        addMenuSublist("", MENU.getSublist());
    }

    private static void addMenuSublist(String currentLabel, List<MenuItem> sublist) {
        int menuItemCount = 0;
        for (MenuItem menuItem : sublist) {
            menuItemCount++;
            String menuLabel = currentLabel + menuItemCount;
            addMenuItem(menuLabel, menuItem);
            addMenuSublist(menuLabel + "_", menuItem.getSublist());
        }
    }

    private static void addMenuItem(String label, MenuItem menuItem) {
        menuItem.setKey(label);
        MENU_MAP.put(label, menuItem);
    }

    public static MenuItem getContentMenuItem(String pageNumber) {
        if (pageNumber == null) pageNumber = DEFAULT_PAGE_NUMBER;
        MenuItem menuItem = MENU_MAP.get(pageNumber);
        if (menuItem == null) menuItem = MENU_MAP.get(DEFAULT_PAGE_NUMBER);

        return menuItem;
    }
}

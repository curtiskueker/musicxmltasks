package org.curtis.content;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ContentMenu {
    private static final MenuItem MENU;

    private static Map<String, MenuItem> MENU_MAP;
    private static final String DEFAULT_PAGE_NUMBER = "1";

    private static final String TABLE_REFERENCE_MENU_ITEM = "Table Reference";
    public static String TABLE_REFERENCE_PAGE_NUMBER;

    static {
        MENU = new MenuItem(
                Arrays.asList(
                        new MenuItem("Outline", "outline.jsp"),
                        new MenuItem("Tasks",
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
                                        new MenuItem("Validate XML", "interface/validate.jsp"),
                                        new MenuItem("DB Settings", "interface/dbSettings.jsp"),
                                        new MenuItem("Lilypond/PDF", "interface/lilypondPdf.jsp"),
                                        new MenuItem("Output", "interface/output.jsp"),
                                        new MenuItem("DB Actions", "interface/dbActions.jsp")
                                )
                        ),
                        new MenuItem("Database Layout", "database/layout.jsp",
                                Arrays.asList(
                                        new MenuItem("Score", "database/score.jsp"),
                                        new MenuItem("Score Header", "database/scoreHeader.jsp"),
                                        new MenuItem("Music Data",
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
                                        new MenuItem("Notation", "database/notation.jsp"),
                                        new MenuItem("Display"),
                                        new MenuItem(TABLE_REFERENCE_MENU_ITEM,
                                                Tables.TABLE_NAMES.stream().map(table -> new MenuItem(new TableReference(table))).collect(Collectors.toList())
                                        )
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
        if (menuItem.getTitle() != null && menuItem.getTitle().equals(TABLE_REFERENCE_MENU_ITEM)) TABLE_REFERENCE_PAGE_NUMBER = label;
        MENU_MAP.put(label, menuItem);
    }

    public static MenuItem getContentMenuItem(String pageNumber) {
        if (pageNumber == null) pageNumber = DEFAULT_PAGE_NUMBER;
        MenuItem menuItem = MENU_MAP.get(pageNumber);
        if (menuItem == null) menuItem = MENU_MAP.get(DEFAULT_PAGE_NUMBER);

        return menuItem;
    }
}

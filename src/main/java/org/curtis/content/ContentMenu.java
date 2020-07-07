package org.curtis.content;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContentMenu {
    private static MenuItem MENU;

    private static Map<String, MenuItem> MENU_MAP;
    private static final String DEFAULT_PAGE_NUMBER = "1";

    static {
        MENU = new MenuItem(
                Arrays.asList(
                        new MenuItem("Outline", "outline.jsp"),
                        new MenuItem("Tasks",
                                Arrays.asList(
                                        new MenuItem("Convert", "interface/convert/convert.jsp"),
                                        new MenuItem("Validate XML", "interface/validate.jsp"),
                                        new MenuItem("DB Settings", "interface/dbSettings.jsp"),
                                        new MenuItem("Lilypond/PDF", "interface/lilypondPdf.jsp"),
                                        new MenuItem("Output", "interface/output.jsp"),
                                        new MenuItem("DB Actions", "interface/dbActions.jsp")
                                ))
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

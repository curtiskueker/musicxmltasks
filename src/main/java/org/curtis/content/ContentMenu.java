package org.curtis.content;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContentMenu {
    private static List<List<MenuItem>> MENU_ITEMS = Arrays.asList(
            Collections.singletonList(
                    new MenuItem("Outline", "outline.jsp")
            ),
            Arrays.asList(
                    new MenuItem("Page 2", "page2.jsp"),
                    new MenuItem("Subpage", "subpage.jsp")
            )
    );

    private static Map<String, MenuItem> MENU_MAP;

    private ContentMenu() {

    }

    private static synchronized void initializeContentMap() {
        MENU_MAP = new HashMap<>();

        Integer menuItemCount = 0;
        for (List<MenuItem> menuItemList : MENU_ITEMS) {
            menuItemCount++;
            String menuKey = String.valueOf(menuItemCount);
            Integer subItemCount = 0;
            if (subItemCount > 0) menuKey += "." + String.valueOf(subItemCount);
            subItemCount++;
        }
    }
}

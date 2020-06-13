package org.curtis.content;

public class MenuItem {
    private String title;
    private String pageName;

    public MenuItem(String title, String pageName) {
        this.title = title;
        this.pageName = pageName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }
}

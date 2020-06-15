package org.curtis.content;

import java.util.ArrayList;
import java.util.List;

public class MenuItem {
    private String title;
    private String pageName;
    private String key;
    private List<MenuItem> sublist = new ArrayList<>();

    public MenuItem() {

    }

    public MenuItem(String title, String pageName) {
        this.title = title;
        this.pageName = pageName;
    }

    public MenuItem(String title, String pageName, List<MenuItem> sublist) {
        this(title, pageName);
        this.sublist = sublist;
    }

    public MenuItem(List<MenuItem> sublist) {
        this(null, null, sublist);
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

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getKeyDisplay() {
        return key.replace('_', '.');
    }

    public List<MenuItem> getSublist() {
        return sublist;
    }

    public void setSublist(List<MenuItem> sublist) {
        this.sublist = sublist;
    }
}

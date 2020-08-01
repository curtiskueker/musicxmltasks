package org.curtis.content;

public class TableReference {
    private final String pageName = "database/reference/tableReference.jsp";
    private String tableName;

    public TableReference(String tableName) {
        this.tableName = tableName;
    }

    public String getPageName() {
        return pageName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}

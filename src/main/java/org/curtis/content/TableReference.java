package org.curtis.content;

public class TableReference {
    private String tableName;

    public TableReference(String tableName) {
        this.tableName = tableName;
    }

    public String getPageName() {
        return "database/reference/table.jsp";
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}

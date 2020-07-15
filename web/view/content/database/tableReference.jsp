<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="content" class="org.curtis.content.MenuItem" scope="request"/>
<c:set var="tableName" value="${content.tableReference.tableName}"/>

<div class="content-header"><c:out value="${tableName}"/></div>

<div id="table-reference-pane">[ <c:out value="${tableName}"/> image]</div>
<div id="table-reference-content">
    <jsp:include page="tableContent.jsp">
        <jsp:param name="includeSection" value="${tableName}"/>
    </jsp:include>
</div>

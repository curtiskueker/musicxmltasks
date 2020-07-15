<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="content" class="org.curtis.content.MenuItem" scope="request"/>
<div class="content-header">Table Reference</div>

<div class="content-section"><c:out value="${content.tableReference.tableName}"/></div>

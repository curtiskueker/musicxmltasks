<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="content" class="org.curtis.content.MenuItem" scope="request"/>
<c:set var="tableName" value="${content.tableReference.tableName}"/>
<c:set var="imageSrc" value="images/table_reference/${tableName}.png"/>
<c:set var="imageAlt" value="[${tableName} image]"/>

<div id="table-reference-image-pane"><img src="${imageSrc}" alt="${imageAlt}"/></div>
<div id="table-reference-content-pane">
    <jsp:include page="tableContent.jsp">
        <jsp:param name="tableName" value="${tableName}"/>
    </jsp:include>
</div>

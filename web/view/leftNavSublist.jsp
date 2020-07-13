<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="menuSubitem" class="org.curtis.content.MenuItem" scope="request"/>

<li>
    <div class="nav-item">
        <c:choose>
            <c:when test="${empty menuSubitem.sublist}"><c:set var="selectionClass" value="no-selection"/></c:when>
            <c:otherwise><c:set var="selectionClass" value="selection"/></c:otherwise>
        </c:choose>
        <span id="${menuSubitem.key}" class="${selectionClass}"></span>
        <c:choose>
            <c:when test="${empty menuSubitem.pageName}">${menuSubitem.title}</c:when>
            <c:otherwise><a href="/${menuSubitem.key}">${menuSubitem.title}</a></c:otherwise>
        </c:choose>
    </div>
    <c:if test="${not empty menuSubitem.sublist}">
        <ul class="hide-list">
            <c:forEach var="menuItem" items="${menuSubitem.sublist}">
                <c:set var="menuSubitem" value="${menuItem}" scope="request"/>
                <jsp:include page="leftNavSublist.jsp"/>
            </c:forEach>
        </ul>
    </c:if>
</li>

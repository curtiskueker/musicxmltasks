<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="menuSubitem" class="org.curtis.content.MenuItem" scope="request"/>

<c:if test="${not empty menuSubitem.title}">
    <li>
        <div class="nav-item">
            <c:if test="${not empty menuSubitem.sublist}">
                <span class="selection">
            </c:if>
                ${menuSubitem.keyDisplay} <a href="/${menuSubitem.key}">${menuSubitem.title}</a>
            <c:if test="${not empty menuSubitem.sublist}">
                </span>
            </c:if>
        </div>
    </li>
</c:if>

<c:if test="${not empty menuSubitem.sublist}">
    <c:choose>
        <c:when test="${empty menuSubitem.title}">
            <ul id="tasks-nav">
        </c:when>
        <c:otherwise>
            <ul class="hide-list">
        </c:otherwise>
    </c:choose>
    <c:forEach var="menuItem" items="${menuSubitem.sublist}">
        <c:set var="menuSubitem" value="${menuItem}" scope="request"/>
        <jsp:include page="leftNavSublist.jsp"/>
    </c:forEach>
    </ul>
</c:if>

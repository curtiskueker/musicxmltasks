<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="menuSubitem" class="org.curtis.content.MenuItem" scope="request"/>

<c:if test="${not empty menuSubitem.title}">
    <li><div class="nav-item"><a href="/${menuSubitem.key}">${menuSubitem.title}</a></div></li>
</c:if>
<ul>
    <c:forEach var="menuItem" items="${menuSubitem.sublist}">
        <c:set var="menuSubitem" value="${menuItem}" scope="request"/>
        <jsp:include page="leftNavSublist.jsp"/>
    </c:forEach>
</ul>
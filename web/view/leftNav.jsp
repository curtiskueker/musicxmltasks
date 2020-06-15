<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="menu" class="org.curtis.content.MenuItem" scope="request"/>

<div class="nav-header">MusicXML Tasks</div>
<ul id="tasks-nav">
    <c:forEach var="menuItem" items="${menu.sublist}">
        <c:set var="menuSubitem" value="${menuItem}" scope="request"/>
        <jsp:include page="leftNavSublist.jsp"/>
    </c:forEach>
</ul>
<script type="text/javascript" src="js/menu.js"></script>

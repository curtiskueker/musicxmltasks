<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="menu" class="org.curtis.content.MenuItem" scope="request"/>

<div class="nav-header">MusicXML Tasks</div>
<c:set var="menuSubitem" value="${menu}" scope="request"/>
<jsp:include page="leftNavSublist.jsp"/>
<script type="text/javascript" src="js/menu.js"></script>

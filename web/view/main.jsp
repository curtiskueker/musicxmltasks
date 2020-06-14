<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="content" class="org.curtis.content.MenuItem" scope="request"/>
<c:set var="pageName" value="content/${content.pageName}"/>
<html>
  <head>
    <title>${content.title}</title>
    <link href="css/main.css" type="text/css" rel="stylesheet">
  </head>
  <body>
    <div id="header"><jsp:include page="header.jsp"/></div>
    <div id="nav"><jsp:include page="leftNav.jsp"/></div>
    <div id="content"><jsp:include page="${pageName}"/></div>
  </body>
</html>

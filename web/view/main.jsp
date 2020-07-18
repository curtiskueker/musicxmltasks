<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="content" class="org.curtis.content.MenuItem" scope="request"/>
<c:choose>
    <c:when test="${empty content.tableReference}"><c:set var="pageName" value="content/${content.pageName}"/></c:when>
    <c:otherwise><c:set var="pageName" value="content/${content.tableReference.pageName}"/></c:otherwise>
</c:choose>

<html>
  <head>
      <title>${content.title}</title>
      <link type="text/css" href="css/main.css" rel="stylesheet">
      <link type="text/css" href="css/menu.css" rel="stylesheet">
      <link type="text/css" href="css/tables.css" rel="stylesheet">
      <link type="text/css" href="css/image.css" rel="stylesheet">
      <script type="text/javascript">
          var pageNumber = '<%= request.getAttribute("pageNumber") %>';
      </script>
  </head>
  <body>
    <div id="header"><jsp:include page="header.jsp"/></div>
    <div id="nav"><jsp:include page="leftNav.jsp"/></div>
    <div id="content"><jsp:include page="${pageName}"/></div>
    <div id="footer"></div>
  </body>
</html>

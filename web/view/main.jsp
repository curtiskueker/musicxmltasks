<%@ page contentType="text/html;charset=UTF-8"%>
<html>
  <head>
    <title>title</title>
    <link href="css/main.css" type="text/css" rel="stylesheet">
  </head>
  <body>
    <div id="header"><jsp:include page="header.jsp"/></div>
    <div id="nav"><jsp:include page="leftNav.jsp"/></div>
    <div id="content"><jsp:include page="content/${requestScope.content}.jsp"/></div>
  </body>
</html>

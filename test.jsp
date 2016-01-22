<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
	<title>Groupe - Kwa2Bo</title>
</head>
<body>
  <form action="${pageContext.request.contextPath}/servlet/Groupe" method="POST">
    <input type="hidden" name="mail" value="ferrot@gmail.com"/>
    <input type="hidden" name="jspName" value="/test.jsp"/>
    <input type="submit"/>
  </form>
  </br>
  ${groupes}
</body>
</html>

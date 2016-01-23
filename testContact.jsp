<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bubble.css"/>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/verifForm.js"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<title>Groupe - Kwa2Bo</title>
</head>
<body>
  <form action="${pageContext.request.contextPath}/servlet/Contact" method="POST">
    <input type="hidden" name="mail" value="ferrot@gmail.com"/>
    <input type="hidden" name="jspName" value="/testContact.jsp"/>
    <input type="submit"/>
  </form>
  </br>

  <c:forEach items="${listeUtilisateurs}" var="elem">
    <c:out value="${elem.mailUtilisateur}" />
    <c:out value="${elem.pseudoUtilisateur}" />
    </br>
  </c:forEach>
</body>
</html>

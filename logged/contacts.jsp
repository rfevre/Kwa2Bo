<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bubble.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}${pageContext.servletContext.getInitParameter("style")} />
	<title>Conversation - Kwa2Bo</title>
</head>
<body>
	<div class="container">
    <jsp:include page="../header.jsp">
        <jsp:param name="page" value="contacts"/>
    </jsp:include>
		<section class="row">
			<div class="container-fluid">
				<div class="col-lg-6">
					<h4>Ajouter des amis</h4>
					<div class="input-group">
						<input type="text" id="searchBar" class="form-control" placeholder="Chercher un ami..." onKeyUp="searchContact()" autocomplete="off">
						<span class="input-group-btn">
							<a class="btn btn-default" onclick="searchContact()">
								<span class="glyphicon glyphicon-search text-muted"></span>
							</a>
						</span>
					</div>
					<div id="amis" class="panel amis">
						<table class="table" id="searchContact-list">
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div id="membres" class="col-lg-6 panel ">
					<h4>Liste de contacts</h4>
          			<div class="input-group">
						<input type="text" id="searchBarContact" class="form-control" placeholder="Chercher un ami..." onKeyUp="searchListContact()" autocomplete="off"/>
						<span class="input-group-btn">
							<a class="btn btn-default" onclick="searchListContact()">
								<span class="glyphicon glyphicon-search text-muted"></span>
							</a>
						</span>
					</div>
					<div id="amisList" class="panel amis">
						<table class="table" id="contact-list">
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
    </section>
    <%@include file="../footer.jsp" %>
	</div>
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/requetesAjax.js"></script>
  <script src="${pageContext.request.contextPath}/js/contacts.js"></script>
</body>
</html>

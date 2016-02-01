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
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/verifForm.js"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<title>Connexion - Kwa2Bo</title>
  <%
    if (request.isUserInRole("logged")) {
      RequestDispatcher rd = null;
      rd = getServletContext().getRequestDispatcher("/logged/conversations.jsp");
      rd.forward(request, response);
    }
  %>
</head>
<body>
	<div class="container">
		<header class="row">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
				<!-- Pour les ecrans de telephone-->
					<div class="navbar-header">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/">
							<span>Koi2Bo</span>
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div id = "log" class="pull-right">
						<form action="j_security_check" method="POST" class="form-horizontal">
								<input type = "text" name="j_username" placeholder="Adresse mail"/>
								<input type = "password" name="j_password" placeholder="Mot de passe"/>
								<input type = "submit" value="Connexion" class="btn btn-success btn-sm"/>
						</form>
						<a href="#">Mot de passe oublié ?</a>
					</div>
				</div>
			</nav>
		</header>
		<section class="row">
			<img src="${pageContext.request.contextPath}/res/img/logoUniv.svg" alt="logo de l'université de Lille 1" class="col-md-7 hidden-xs"/>
			<div id="inscription" class="col-md-5">
				<legend><h1>Inscription</h1></legend>
				<form action="${pageContext.request.contextPath}/servlet/Inscription" method="POST" id="inscription" class="form-group">
					<div id="divPseudo" class="">
						<p>
							<input type="text" class="form-control" placeholder="Pseudo" name="pseudo" onKeyUp="updateStateOf(divPseudo, 'Pseudo trop court');"/>
						</p>
						<span class="" aria-hidden="true"></span>
					</div>
					<div id="divMail1" class="">
						<p>
							<input type="text" id="mail1" class="form-control" placeholder="Adresse mail" name="mail1" onKeyUp="updateStateMail(divMail1, 'Adresse mail incorrecte');"/>
						</p>
						<span class="" aria-hidden="true"></span>
					</div>
					<div id="divMail2" class="">
						<p>
							<input type="text" id="mail2" class="form-control" placeholder="Confirmez l'adresse mail" name="mail2" onKeyUp="updateStateMail(divMail2, 'Adresse mail incorrecte');checkMail1EqualsMail2(mail1,mail2)"/>
						</p>
						<span class="" aria-hidden="true"></span>
					</div>
					<div id="divMdp1" class="">
						<p>
							<input type="password" class="form-control" placeholder="Mot de passe" name="mdp1" onKeyUp="updateStateOf(divMdp1, 'Mot de passe trop court');"/>
						</p>
						<span class="" aria-hidden="true"></span>
					</div>
					<div id="divMdp2" class="">
	          			<p>
	          				<input type="password" class="form-control" placeholder="Confirmez mot de passe" name="mdp2" onKeyUp="updateStateOf(divMdp2, 'Mot de passe trop court');"/>
	          			</p>
	          			<span class="" aria-hidden="true"></span>
					</div>
					<input type="submit" value="Inscription" class="btn btn-success"/>
				</form>
			</div>
		</section>
	</div>
</body>
</html>

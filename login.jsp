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
	<title>Connexion - Kwa2Bo</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<div class="home col-md-4">
				<img id="logoDuSite" alt="logo du site" src="${pageContext.request.contextPath}/res/img/logoWA.png"/>
				<label>Kwa2Bo</label>
			</div>
			<div id = "log" class="col-md-offset-3 col-md-5">
					<form action="j_security_check" method="POST" class="form-horizontal">
							<input type = "text" name="j_username" placeholder="Adresse mail"/>
							<input type = "password" name="j_password" placeholder="Mot de passe"/>
							<input type = "submit" value="Connexion" class="btn btn-success btn-sm"/>
					</form>
					<a href="#">Mot de passe oublié ?</a>
			</div>
		</header>
		<section class="row">
			<img src="${pageContext.request.contextPath}/res/img/logoUniv.svg" alt="logo de l'université de Lille 1" class="col-md-7 hidden-xs"/>
			<div id="inscription" class="col-md-5">
				<legend><h1>Inscription</h1></legend>
				<form action="#" method="POST" class="form-group">
					<p><input type="text" class="form-control" placeholder="Pseudo" name="pseudo"/></p>
					<p><input type="text" class="form-control" placeholder="Adresse mail" name="mail1"/></p>
					<p><input type="text" class="form-control" placeholder="Confirmez l'adresse" name="mail2"/></p>
					<p><input type="text" class="form-control" placeholder="Mot de passe" name="mdp1"/></p>
          <p><input type="text" class="form-control" placeholder="Confirmez mot de passe" name="mdp2"/></p>
					<input type="submit" value="Inscription" class="btn btn-success"/>
				</form>
			</div>
		</section>
	</div>
</body>
</html>

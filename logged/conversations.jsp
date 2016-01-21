<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/verifForm.js"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<title>Conversation - Kwa2Bo</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<div class="home col-md-4">
				<img id="logoDuSite" alt="logo du site" src="${pageContext.request.contextPath}/res/img/logoWA.png"/>
				<label>Kwa2Bo</label>
			</div>
			<div id = "log" class="col-md-offset-3 col-md-5">

			</div>
		</header>
		<section class="row">
			<form class="col-md-3">
				<input type="submit" value="Search" class="btn btn-success"/>
				<input type="text" placeholder="Chercher un contact"/>
			</form>
			<button class="pull-right btn btn-md btn-success">Nouveau Groupe</button>
		</section>
		<section class="row">
			<section id="discussions" class="col-md-4">
				<table class="table">
					<tr>
						<th>
							Discussions
						</th>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Petite bouffe jeudi soir</h3>
								<h4>Remy Fevre :</h4>
								<h5>Putain mais trop mon gars !!!</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Edouard Cattez</h3>
								<h5>A la fin Han Solo meurt</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Edouard Cattez</h3>
								<h5>A la fin Han Solo meurt</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Projet com' ! de la mort qui tue</h3>
								<h4>Thomas Ferro</h4>
								<h5>Rocket League ?</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Projet com' ! de la mort qui tue</h3>
								<h4>Thomas Ferro</h4>
								<h5>Rocket League ?</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Projet com' ! de la mort qui tue</h3>
								<h4>Thomas Ferro</h4>
								<h5>Rocket League ?</h5>
							</a>
						</td>
					</tr>
					<tr>
						<td class="row">
							<a class="btn btn-default">
								<h3>Projet com' ! de la mort qui tue !!!!!!!</h3>
								<h4>Thomas Ferro</h4>
								<h5>Rocket League ?</h5>
							</a>
						</td>
					</tr>
				</table>
			</section>
			<section id="conversation" class="col-md-8">
				<h3>
					Conversation en cours
				</h3>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="alert alert-info" role="alert">
							<strong>Remy :</strong>
							<label>Bonjour !</label>
						</div>
						<div class="alert alert-success" role="alert">
							<strong>Vous :</strong>
							<label>Ca va ?</label>
						</div>
					</div>
				</div>
				<form class="form-horizontal">
					<textarea class="form-control" placeholder="Tapez votre message ici ..."></textarea>
					<br/>
					<input type="submit" value="Envoyer" class="btn btn-default"/>
				</form>
			</section>
		</section>
		<footer>
			<nav class="navbar-fixed-bottom">
				<div class="container">
					<ul class="nav nav-bar nav-justified nav-collapse">
						<li class="col-md"><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
						<li class="col-md"><a href="#"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></a></li>
						<li class="col-md"><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></li>
					</ul>
				</div>
			</nav>
		</footer>
	</div>
</body>
</html>

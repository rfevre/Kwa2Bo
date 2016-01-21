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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bubble.css"/>
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
			<div id = "log" class="pull-right">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	    				<span class="caret"></span>
	  				</button>
	  				<ul class="dropdown-menu dropdown-menu-right">
	    				<li><a href="#">Déconnexion</a></li>
	 				</ul>
				</div>
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
			<h3>Discussions</h3>
			<section id="discussions" class="col-md-5">
				<table class="table">
					<tbody>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Petite bouffe jeudi soir</h3>
									<h4 class="hidden-xs">Remy Fevre :</h4>
									<h5 class="hidden-xs">Putain mais trop mon gars !!!</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Edouard Cattez</h3>
									<h5 class="hidden-xs">A la fin Han Solo meurt</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Edouard Cattez</h3>
									<h5 class="hidden-xs">A la fin Han Solo meurt</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Projet com' ! de la mort qui tue</h3>
									<h4 class="hidden-xs">Thomas Ferro</h4>
									<h5 class="hidden-xs">Rocket League ?</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Projet com' ! de la mort qui tue</h3>
									<h4 class="hidden-xs">Thomas Ferro</h4>
									<h5 class="hidden-xs">Rocket League ?</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Projet com' ! de la mort qui tue</h3>
									<h4 class="hidden-xs">Thomas Ferro</h4>
									<h5 class="hidden-xs">Rocket League ?</h5>
								</a>
							</td>
						</tr>
						<tr>
							<td class="row">
								<a class="btn">
									<h3>Projet com' ! de la mort qui tue !!!!!!!!!!!!!!!!!!!!!</h3>
									<h4 class="hidden-xs">Thomas Ferro</h4>
									<h5 class="hidden-xs">Rocket League ?</h5>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section id="conversation" class="col-md-offset-1 col-md-6">
				<h3>
					Conversation en cours
				</h3>
				<div class="panel panel-default">
					<div class="panel-body">
						Remy Fevre
						<div class="alert alert-info commentArea" role="alert">
							<div class="bubbledLeft">
								Remy :
							</div>
							<div class="bubbledRight">
								Vous :
							</div>
						</div>
					</div>
				</div>
				<form class="form-horizontal">
					<textarea class="form-control" placeholder="Tapez votre message ici ..."></textarea>
					<br/>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					</button>
					<input type="submit" value="Envoyer" class="btn btn-default"/>
				</form>
			</section>
		</section>
		<footer>
			<nav class="">
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

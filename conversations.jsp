<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/position.css"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>Conversation - Kwa2Bo</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<div class="home col-md-4">
				<img id="logoDuSite" alt="logo du site" src="res/img/logoWA.png"/>
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
			<table class="table">
				<tr>
					<td class="row">
						<button class="btn btn-default">
							<h3>Petite bouffe jeudi soir</h3>
							<h4>Remy Fevre :</h4>
							<h5>Putain mais trop mon gars !!!</h5>
						</button>
					</td>
				</tr>
				<tr>
					<td class="row">
						<button class="btn btn-default">
							<h3>Edouard Cattez</h3>
							<h5>A la fin Han Solo meurt</h5>
						</button>
					</td>
				</tr>
				<tr>
					<td class="row">
						<button class="btn btn-default">
							<h3>Edouard Cattez</h3>
							<h5>A la fin Han Solo meurt</h5>
						</button>
					</td>
				</tr>
				<tr>
					<td class="row">
						<button class="btn btn-default">
							<h3>Projet com' ! de la mort qui tue</h3>
							<h4>Thomas Ferro</h4>
							<h5>Rocket League ?</h5>
						</button>
					</td>
				</tr>
			</table>
		</section>
		<footer>
			<nav class="navbar-fixed-bottom">
				<div class="container">
					<ul class="nav nav-bar nav-justified nav-collapse">
						<li class="col-md-4"><a href="#">Contacts</a></li>
						<li class="col-md-4"><a href="#">Discussion</a></li>
						<li class="col-md-4"><a href="#">Réglages</a></li>
					</ul>
				</div>
			</nav>
		</footer>
	</div>
</body>
</html>
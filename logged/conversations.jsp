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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>

	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/requetesAjax.js" async="false"></script>
	<script src="${pageContext.request.contextPath}/js/conversations.js" async="false"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<title>Conversation - Kwa2Bo</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
				<!-- Pour les ecrans de telephone-->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-1">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">
							<span>Koi2Bo</span>
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="col-md">
								<a href="#">
									<span class="glyphicon glyphicon-user"></span>
								</a>
							</li>
							<li class="active">
								<a href="#">
									<span class="glyphicon glyphicon-comment"></span>
								</a>
							</li>
							<li class="col-md">
								<a href="#">
									<span class="glyphicon glyphicon-cog"></span>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
									<span>Julien Leleu </span>
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="servlet/Logout">Déconnexion</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<section class="row">
			<button class="pull-left btn btn-md btn-success">
				<span class="glyphicon glyphicon-plus"></span> 
				Nouveau Message
			</button>
		</section>
		<section class="row">
			<h3>Discussions</h3>
			<section id="discussions" class="col-md-5">
				<table class="table">
					<tbody>
					</tbody>
				</table>
			</section>
			<section id="conversation" class="col-md-offset-1 col-md-6">
				<h3>
					Conversation en cours
				</h3>
				<div class="panel panel-default">
					<button class="btn btn-default btn-xs">
						<span class="glyphicon glyphicon-plus"></span>
					</button> 
					<!--<label>Remy Fevre</label>-->
				</div>
				<div id="messageArea" class="panel panel-default">
					<div class="panel-body">
						<div class="bubbledLeft">
							Remy :
							Salut mon pote ça va ?
						</div>
						<div class="bubbledRight">
							Vous :
							Bien bien et toi ?
						</div>
						<div class="bubbledLeft">
							Remy :
							Ouais !!
						</div>
						<div class="bubbledRight">
							Vous :
							J'ai commit des trucs pour le projet
						</div>
						<div class="bubbledLeft">
							Remy :
							Ouais j'ai vu c'est trop styléé !!
						</div>
						<div class="bubbledRight">
							Vous :
							Merci ^^
						</div>
						<div class="bubbledLeft">
							Remy :
							Bon je vais dormir, a demain ! :p
						</div>
						<div class="bubbledRight">
							Vous :
							Bonne nuit mon bon remy 
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
	</div>
</body>
</html>

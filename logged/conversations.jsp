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
			<button type="button" class="pull-left btn btn-md btn-success" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-plus"></span> 
				Nouveau groupe
			</button>
		<!-- Fenêtre modale pour la création d'un nouveau message -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Nouveau groupe</h4>
					</div>
					<div class="modal-body">
						<form method="POST" class="form-group">
							<input type="text" placeholder="Nom du groupe" class="form-control"/>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
						<button type="button" class="btn btn-success">Créer</button>
					</div>
				</div>
			</div>
		</div>
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
					</div>
				</div>
				<form id="formConversation" class="form-horizontal">
					<textarea class="form-control" placeholder="Tapez votre message ici ..." name="contenu"></textarea>
					<br/>
					<button class="btn btn-default">
						<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					</button>
					<input type="hidden" value="" name="idGroupe"/>
					<input type="submit" value="Envoyer" class="btn btn-default"/>
				</form>
			</section>
		</section>
	</div>
</body>
</html>

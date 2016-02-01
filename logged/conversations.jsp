<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8"/>
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
							<a class="navbar-brand" href="${pageContext.request.contextPath}/">
								<span>Koi2Bo</span>
							</a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li class="col-md">
									<a href="${pageContext.request.contextPath}/logged/contacts.jsp">
										<span class="glyphicon glyphicon-user"></span>
									</a>
								</li>
								<li class="active">
									<a href="${pageContext.request.contextPath}">
										<span class="glyphicon glyphicon-comment"></span>
									</a>
								</li>
								<li class="col-md">
									<a href="${pageContext.request.contextPath}/servlet/SelectProfil">
										<span class="glyphicon glyphicon-cog"></span>
									</a>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
										<span>${pageContext.request.remoteUser}</span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li>
											<a href="${pageContext.request.contextPath}/servlet/Logout">Déconnexion</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</header>
			<section class="row panel">
				<aside class="col-md-6">
					<h3>Discussions</h3>
					<div id="discussions">
						<table class="table">
							<tbody>
							</tbody>
						</table>
					</div>
				</aside>
				<div id="conversation" class="modal fade" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
								<h3 class="modal-title" id="myModalLabel"></h3>
							</div>
							<div>
								<div id="contacts" class="container-fluid">
									<button class="btn btn-default btn-xs pull-left">
										<span class="glyphicon glyphicon-plus"></span>
									</button>
									<div id="participants"></div>
								</div>
								<div id="messageArea" class="panel panel-default">
									<div class="panel-body">
									</div>
								</div>
								<form id="formConversation" method="post" action="${pageContext.request.contextPath}/servlet/InsertMessage" enctype="multipart/form-data">
								    <textarea class="form-control" placeholder="Tapez votre message ici ..." name="content"></textarea>
								    <span class="btn btn-default btn-file">
								    	<span class="glyphicon glyphicon-camera"></span>
								    	<input type="file" name="image" accept="image/*"/>
								    </span>
									<input type="hidden" value="" name="idGroupe"/>
								    <input type="submit" class="btn btn-default" value="Envoyer"/>
								</form>
							</div>
						</div>
					</div>
				</div>
				<aside id="formGroupe" class="panel panel-default col-md-6">
					<h3>Nouveau groupe</h3>
					<form action="${pageContext.request.contextPath}/servlet/InsertGroupe" method="GET"  autocomplete="off" >
						<div class="form-group">
							<label for="inputNomGroupe">Nom du groupe</label>
							<input type="text" class="form-control" name="nomGroupe" placeholder="Exemple : La dream-team" id="inputNomGroupe"/>
						</div>
						<label for="exampleInputEmail1">Ajouter des membres</label>
						<div class="container-fluid">
							<div class="row">
								<div class="col-lg-6">
									<div class="input-group">
										<input type="text" id="searchBar" class="form-control" placeholder="Pseudo" onKeyUp="searchContact()" />
										<span class="input-group-btn">
											<a class="btn btn-default" onclick="searchContact()">
												<span class="glyphicon glyphicon-search text-muted"></span>
											</a>
										</span>
									</div>
									<ul class="list-group" id="contact-list">
									</ul>
								</div>
								<div id="membres" class="col-lg-6 panel ">
									<ul class="list-inline">
									</ul>
								</div>
							</div>
						</div>
						<input class="btn btn-success" type="submit" value="Créer"/>
					</form>
				</aside>
			</section>
		</div>
	</body>
</html>

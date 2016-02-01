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
							<li class="active">
								<a href="${pageContext.request.contextPath}/logged/contacts.jsp">
									<span class="glyphicon glyphicon-user"></span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}">
									<span class="glyphicon glyphicon-comment"></span>
								</a>
							</li>
							<li>
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
		<section class="row">
			<div class="container-fluid">
				<div class="col-lg-6">
					<h4>Ajouter des amis</h4>
					<div class="input-group">
						<input type="text" id="searchBar" class="form-control" placeholder="Chercher un ami..." onKeyUp="searchContact()">
						<span class="input-group-btn">
							<a class="btn btn-default" onclick="searchContact()">
								<span class="glyphicon glyphicon-search text-muted"></span>
							</a>
						</span>
					</div>
					<div id="membres" class="panel">
						<ul class="list-inline">
							<li class="list-group-item">
								<div class="col-sm-2">
									<img src="${pageContext.request.contextPath}/res/profil/default.jpg" class="img-responsive img-circle hidden-xs">
								</div>
								<div class="col-xs-10 col-sm-7">
									<label>Ferroterzefeth</label>
								</div>
								<div>
									<a class="btn btn-success btn-sm col-xs-2 col-sm-2">
										<span class="glyphicon glyphicon-plus-sign"></span>
									</a>
								</div>
								<div class="clearfix"></div>
							</li>
						</ul>
					</div>
				</div>
				<div id="membres" class="col-lg-6 panel ">
					<h4>Demande d'ajout en attente</h4>
					<ul class="list-inline">
					</ul>
				</div>
			</div>
	</div>
</body>
</html>

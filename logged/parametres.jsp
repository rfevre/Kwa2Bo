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
							<li>
								<a href="${pageContext.request.contextPath}/logged/contacts.jsp">
									<span class="glyphicon glyphicon-user"></span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}">
									<span class="glyphicon glyphicon-comment"></span>
								</a>
							</li>
							<li class="active">
								<a href="${pageContext.request.contextPath}/logged/parametres.jsp">
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
			<h3>Paramètres</h3>
			<section id="discussions" class="col-md-5">
				<form>
				<div class="form-group">
					<label for="exampleInputEmail1">Pseudo</label>
					<input type="email" class="form-control" placeholder="Exemple : MichouDu59"/>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Nom</label>
					<input type="email" class="form-control" placeholder="Exemple : Jacquie"/>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Prénom</label>
					<input type="email" class="form-control" placeholder="Exemple : Michel"/>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Adresse email</label>
					<input type="email" class="form-control" placeholder="Exemple : JacquieMichel@XXX.com">
				</div>
				<div class="form-group">
					<button type="button" data-toggle="modal" data-target="#formMdp">
						Modifier le mot de passe
					</button>
					<div class="modal fade" id="formMdp" tabindex="-1" role="dialog" aria-labelledby="formMdp">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel">Nouveau mot de passe</h4>
								</div>
								<form action="servlet/InsertGroupe" method="POST" class="form-group">
									<div class="modal-body">
									<div class="form-group">
										<label for="exampleInputEmail1">Mot de passe actuel</label>
										<input type="password" class="form-control"/>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Nouveau mot de passe</label>
										<input type="password" class="form-control">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Confirmez nouveau mot de passe</label>
										<input type="password" class="form-control">
									</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
										<input type="submit" class="btn btn-success" value="Créer"/>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputFile">File input</label>
					<input type="file">
					<p class="help-block">Format JPEG, PNG, GIF, Max : 5Mo</p>
				</div>
					<button type="submit" class="btn btn-success">Enregistrer les modifications</button>
				</form>
			</section>
		</section>
	</div>
</body>
</html>

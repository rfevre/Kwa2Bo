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
		<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}${pageContext.servletContext.getInitParameter("style")} />

		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/js/requetesAjax.js" async ></script>
		<script src="${pageContext.request.contextPath}/js/conversations.js" async ></script>
		<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
		<title>Conversation - Kwa2Bo</title>
	</head>
	<body>
		<div class="container">
			<jsp:include page="../header.jsp">
					<jsp:param name="page" value="conversations"/>
			</jsp:include>
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
						<label>Ajouter des membres</label>
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
			<%@include file="../footer.jsp" %>
		</div>
	</body>
</html>

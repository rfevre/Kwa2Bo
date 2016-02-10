<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}${pageContext.servletContext.getInitParameter("style")} />
      <title>Confirmation - Kwa2Bo</title>
    </head>
    <body>
      <div class="container">
    		<header class="row">
    			<nav class="navbar navbar-default">
    				<div class="container-fluid">
    				<!-- Pour les ecrans de telephone-->
    					<div class="navbar-header">
    						<a class="navbar-brand" href="${pageContext.request.contextPath}/">
    							<span>Koi2Bo</span>
    						</a>
    					</div>
    					<!-- Collect the nav links, forms, and other content for toggling -->
    					<div id = "log" class="pull-right">
    						<form action="j_security_check" method="POST" class="form-horizontal">
    								<input type = "text" name="j_username" placeholder="Adresse mail"/>
    								<input type = "password" name="j_password" placeholder="Mot de passe"/>
    								<input type = "submit" value="Connexion" class="btn btn-success btn-sm"/>
    						</form>
    						<a href="#">Mot de passe oublié ?</a>
    					</div>
    				</div>
    			</nav>
    		</header>
      <section class="row">
      <img src="${pageContext.request.contextPath}/res/img/logoUniv.svg" alt="logo de l'université de Lille 1" class="col-md-7 hidden-xs"/>
  		<div id="inscription" class="col-md-5">
  		<h1>Confirmation d'inscription</h1>
      <%
        String codeVerif = request.getParameter("codeVerif");
        if (codeVerif!=null) { %>
        <form action="${pageContext.request.contextPath}/servlet/ValidationCompte" method="POST" class="form-group">
          <input type="hidden" name="codeVerif" value=<%= codeVerif%> />
          <input type="submit" value="Valider compte" class="btn btn-success" />
        </form>
        <% } %>
        <br/>
        ${message}
        <br/>
      </div>
      </section>
    </div>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/verifForm.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    </body>
  </html>

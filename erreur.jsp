<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isErrorPage="true"%>
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
  <title>Page d'erreur - Kwa2Bo</title>
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
          <div id = "acceuil" class="pull-right">
            <form method="POST" action="${pageContext.request.contextPath}/">
              <input type="submit" class="btn btn-success" value="Accueil Kwa2Bo"/>
            </form>
          </div>
        </div>
      </nav>
    </header>
    <section class="row">
      <img src="${pageContext.request.contextPath}/res/img/Panneau_attention.svg" alt="panneau attention" class="col-md-7 hidden-xs" width=500 height=400/>
      <div id="inscription" class="col-md-5">
        <legend><h1>Page de gestion d'erreur</h1></legend>
        Un probleme de type <B>"${message}
        <%
        if (exception!=null) out.print(exception.getMessage());
        %>
        "</B> est survenu.
      </div>
    </section>
  </div>
</body>
</html>

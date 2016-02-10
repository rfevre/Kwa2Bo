<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
  <link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}${pageContext.servletContext.getInitParameter("style")} />
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
          <div id="collapse-1" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right" id="menu">
              <li>
                <a href="${pageContext.request.contextPath}/">Accueil Kwa2Bo</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <section class="row">
      <img src="${pageContext.request.contextPath}/res/img/Panneau_attention.svg" alt="panneau attention" class="col-md-7 hidden-xs" width="500" height="400" />
      <div class="col-md-5">
        <div class="panel panel-danger">
          <div class="panel-heading">
              <h1 class="panel-title">
                <strong>Page de gestion d'erreur</strong>
              </h1>
          </div>
          <div class="panel-body">
          Erreur : <strong>"${message}${param.message}
          <%
            if (exception!=null) out.print(exception.getMessage());
            if (request.isUserInRole("undef")) {
              out.print("Vérifiez vos mails");
              session.invalidate();
            }
          %>
          "</strong>
          </div>
        </div>
      </div>
    </section>
    <%@include file="../footer.jsp" %>
  </div>
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/verifForm.js"></script>
  <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

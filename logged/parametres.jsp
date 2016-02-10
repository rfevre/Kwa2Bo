<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="fr">
    <head>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bubble.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/position.css"/>
      <link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}${pageContext.servletContext.getInitParameter("style")}' />

      <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
      <title>Conversation - Kwa2Bo</title>
    </head>
    <body>
      <jsp:useBean id="utilisateur" class="beans.Utilisateur" scope="request"/>
      <div class="container">
        <jsp:include page="../header.jsp">
            <jsp:param name="page" value="parametres"/>
        </jsp:include>
        <script type="text/javascript">
        function open_infos()
        {
          alert('${message}');
        }
        </script>
        <c:if test="${not empty message}">
          <script type="text/javascript"> open_infos(); </script>
        </c:if>
        <section class="row">
          <h3>Paramètres</h3>
          <section class="col-md-5">
            <form action="${pageContext.request.contextPath}/servlet/UpdateProfil" method="POST" id="updateProfil">
              <div class="form-group">
                <label for="inputPseudo">Pseudo</label>
                <input type="text" class="form-control" placeholder="Exemple : MichouDu59" value="${utilisateur.pseudo}" name="pseudo" id="inputPseudo"/>
              </div>
              <div class="form-group">
                <label for="inputNom">Nom</label>
                <input type="text" class="form-control" placeholder="Exemple : Jacquie" value="${utilisateur.profil.nom}" name="nom" id="inputNom"/>
              </div>
              <div class="form-group">
                <label for="inputPrenom">Prénom</label>
                <input type="text" class="form-control" placeholder="Exemple : Michel" value="${utilisateur.profil.prenom}" name="prenom" id="inputPrenom"/>
              </div>
            <div class="form-group">
              <button type="button" data-toggle="modal" data-target="#formMdp">
                Modifier le mot de passe
              </button>
            </div>
            <input type="submit" class="btn btn-success" value="Enregistrer les modifications" form="updateProfil"/>
          </form>
        </section>
        <div class="modal fade" id="formMdp" tabindex="-1" role="dialog" aria-labelledby="formMdp">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Nouveau mot de passe</h4>
              </div>
              <form action="${pageContext.request.contextPath}/servlet/UpdateMdp" method="POST" class="form-group" id="updateMdp">
                <div class="modal-body">
                  <div class="form-group">
                    <label for="inputMdp">Mot de passe actuel</label>
                    <input type="password" class="form-control" name="mdp" id="inputMdp" />
                  </div>
                  <div class="form-group">
                    <label for="inputMdp1">Nouveau mot de passe</label>
                    <input type="password" class="form-control" name="mdp1" id="inputMdp1" />
                  </div>
                  <div class="form-group">
                    <label for="inputMdp2">Confirmez nouveau mot de passe</label>
                    <input type="password" class="form-control" name="mdp2" id="inputMdp2" />
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                  <input type="submit" class="btn btn-success" value="Enregistrer les modifications" form="updateMdp"/>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      <%@include file="../footer.jsp" %>
    </div>
  </body>
</html>

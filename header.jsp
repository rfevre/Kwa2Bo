<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <% if(request.getParameter("page").equals("contacts")) { %>
          <li class="active">
          <% } else { %>
          <li>
          <% } %>
            <a href="${pageContext.request.contextPath}/logged/contacts.jsp">
              <span class="glyphicon glyphicon-user"></span>
            </a>
          </li>
          <% if(request.getParameter("page").equals("conversations")) { %>
          <li class="active">
          <% } else { %>
          <li>
          <% } %>
            <a href="${pageContext.request.contextPath}">
              <span class="glyphicon glyphicon-comment"></span>
            </a>
          </li>
          <% if (request.getParameter("page").equals("parametres")) { %>
          <li class="active">
          <% } else { %>
          <li>
          <% } %>
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

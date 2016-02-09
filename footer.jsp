<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="row panel panel-default">
  <div class="panel-body">
    <div class="pull-left" id="credits">
      Projet Kwa2Bo - Leleu Julien - Fevre Remy - Licence Professionnelle DA2I - 2015/2016
    </div>
    <a href="https://www-iut.univ-lille1.fr/" class="pull-right"><img src=${pageContext.request.contextPath}/${pageContext.servletContext.getInitParameter("logoLille1")} alt="Logo IUT" class="img-rounded"/></a>
    <a href="http://da2i.univ-lille1.fr/" class="pull-right"><img src=${pageContext.request.contextPath}/${pageContext.servletContext.getInitParameter("logoDa2i")} alt="Logo Da2i" class="pull-right img-rounded md-hidden"/></a>
  </div>
</footer>

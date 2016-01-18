<!DOCTYPE HTML>
<html>
    <head>
	<title>Page d'erreur</title>
        <%@ page
               contentType="text/html; charset=ISO-8859-15"
	       isErrorPage="true" %>
	<link rel="stylesheet" href="./css/style.css" type="text/css">
    </head>
<body>

   <h1> Page de gestion d'erreur</h1>
   <h3> Un probleme de type
"<%
	String m = request.getParameter("message");
	if (m!=null) out.print(m);
	if (exception!=null) out.print(exception.getMessage());
 %>" est survenu.</h3>


<a href=login.html>Retour</a>

</body>
</html>

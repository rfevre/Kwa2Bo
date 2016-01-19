<!DOCTYPE html>
<html lang="fr">
<head>
<title>Page de login - Kwa2Bo</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<body>
	<header>
		<img alt="logo du site" src="#"/>
		<div id = "log">
			<h2>Connexion</h2>
			<form action="j_security_check" method="POST">
					<input type = "text" name="j_username" placeholder="Adresse mail"/>
					<input type = "password" name="j_password" placeholder="Mot de passe"/>
					<input type = "submit" value="Connexion" class="btn btn-primary"/>
			</form>
			<a href="#">${message} Mot de passe oublié ? </a>
		</div>
	</header>
	<section>
		<img alt="logo de l'université de Lille 1" />
		<div id="inscription">
			<h1>Inscription</h1>
			<form action="#" method="POST">
				<input type="text" />
				<input type="text" />
				<input type="text" />
				<input type="text" />
				<input type="submit" value="Inscription"/>
			</form>
		</div>
	</section>
</body>
</html>

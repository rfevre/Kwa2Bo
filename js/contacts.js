function addSuggestContact(data) {
	$("#contact-list tbody").empty();
			console.log(data);
	var line = "";
	for (var i = 0; i < data.Utilisateurs.length; i++) {
		line = "<tr>";
		line += "<td><img src=\"../res/profil/default.jpg\" class=\"img-responsive img-circle hidden-xs\"/></td>";
		line += "<td><label>"+ data.Utilisateurs[i].pseudo +"</label></td>\n";
		line += "<td><a class=\"btn btn-success\"><span class=\"glyphicon glyphicon-plus-sign\"></span></a></td>\n";
		line += "</tr>\n";
		/*console.log(data.Utilisateur.contacts[i]);*/
		$("#contact-list tbody").append(line);
	}
}

function searchContact() {
	var parameter = $("input[id=searchBar]").val();
	requeteAjaxParam("../servlet/SelectUtilisateurs", { critere : parameter }, addSuggestContact);
}
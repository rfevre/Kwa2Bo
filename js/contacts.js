searchContact();
searchListContact();

function addSuggestContact(data) {
	$("#searchContact-list tbody").empty();
			console.log(data);
	var line = "";
	for (var i = 0; i < data.Utilisateurs.length; i++) {
		line = "<tr>";
		line += "<td><img src=\"../res/profil/default.jpg\" class=\"img-responsive img-circle hidden-xs\"/></td>";
		line += "<td><label>"+ data.Utilisateurs[i].pseudo +"</label></td>\n";
		line += "<td><a href=\"../servlet/InsertContacts?contact=" + data.Utilisateurs[i].email +"\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-plus-sign\"></span></a></td>\n";
		line += "</tr>\n";
		$("#searchContact-list tbody").append(line);
	}
}

function addListContact(data) {
	$("#contact-list tbody").empty();
	var line = "";
	for (var i = 0; i < data.Utilisateur.contacts.length; i++) {
		line = "<tr>";
		line += "<td><img src=\"../res/profil/default.jpg\" class=\"img-responsive img-circle hidden-xs\"/></td>";
		line += "<td><label>"+ data.Utilisateur.contacts[i].pseudo +"</label></td>\n";
		line += "<td><a href=\"../servlet/DeleteContacts?contact=" + data.Utilisateur.contacts[i].email +"\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-trash\"></span></a></td>\n";
		line += "</tr>\n";
		$("#contact-list tbody").append(line);
	}
}

function searchContact() {
	var parameter = $("input[id=searchBar]").val();
	requeteAjaxParam("../servlet/SelectUtilisateurs", { critere : parameter }, addSuggestContact);
}

function searchListContact() {
	var parameter = $("input[id=searchBarContact]").val();
	requeteAjaxParam("../servlet/SelectContact", { critere : parameter }, addListContact);
}

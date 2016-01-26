
function displayGroupes(data) {
		var line;
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a onclick=\"requeteAjaxParam('servlet/SelectMessage', {idGroupe : " + data.Groupes[i].idGroupe +" },  displayConversation)\" class=\"btn\">\n";
		line += "\t\t\t<h3>" + data.Groupes[i].nom + "</h3>\n";
		line += "\t\t</a>\n";
		line += "\t</td>\n";
		line += "</tr>\n";
		$("#discussions table tbody").append(line);
	}
}

function displayConversation(data) {
	console.log(data);
	$("#messageArea .panel-body").empty();
	var line;
	for (var i = 0; i < data.Groupe.messages.length; i++) {
		if (data.Groupe.messages[i].expediteur.email === data.remoteUser) {
			line = "<div class=\"bubbledRight\">";
		}
		else {
			line = "<div class=\"bubbledLeft\">";
		}
		line += data.Groupe.messages[i].expediteur.pseudo + " : \n";
		line += data.Groupe.messages[i].contenu;
		line += "</div>\n";
		$("#messageArea .panel-body").append(line);
	}
}

requeteAjax("servlet/SelectGroupe", displayGroupes);
//Avec paramètres
/*var parameters = { idGroupe : 1 };
requeteAjaxParam("servlet/SelectMessage", parameters,  displayConversation);*/
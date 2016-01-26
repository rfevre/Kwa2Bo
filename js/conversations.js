
function displayGroupes(data) {
		var line;
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a onclick=\"setInterval('majConversation({idGroupe : " + data.Groupes[i].idGroupe +"})', 1000)\" class=\"btn\">\n";
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
		$('#messageArea .panel-body').append(line);
	}
	$('#formConversation input[name="idGroupe"]').val(data.Groupe.idGroupe);
}

function majConversation(parameters) {
	requeteAjaxParam('servlet/SelectMessage', parameters,  displayConversation);
}

function doInsert(form) {
	parameters = {
		idGroupe : $(form + ' input[name="idGroupe"]').val(),
		texte : $(form + ' textarea').val(),
		image : ''
	}
	requeteAjaxParam("servlet/InsertMessage", parameters);
}

requeteAjax("servlet/SelectGroupe", displayGroupes);
//Avec paramètres
/*var parameters = { idGroupe : 1 };
requeteAjaxParam("servlet/SelectMessage", parameters,  displayConversation);*/
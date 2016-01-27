timer = undefined;
requeteAjax("servlet/SelectGroupe", displayGroupes);

function displayGroupes(data) {
		var line;
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a onclick=\"majConversation(" + data.Groupes[i].idGroupe + ")\" class=\"btn\">\n";
		line += "\t\t\t<h3>" + data.Groupes[i].nom + "</h3>\n";
		line += "\t\t</a>\n";
		line += "\t</td>\n";
		line += "</tr>\n";
		$("#discussions table tbody").append(line);
	}
}

function displayConversation(data) {
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
	var scrollBar = document.getElementById("messageArea");
	scrollBar.scrollTop = scrollBar.scrollHeight;
}

function majConversation(parameter) {
	if (timer != undefined) {
		clearInterval(timer);
	}
	requeteAjaxParam('servlet/SelectMessage', { idGroupe : parameter },  displayConversation);
	timer = setInterval("requeteAjaxParam('servlet/SelectMessage', { idGroupe : " + parameter + "},  displayConversation)", 1000);
}

function doInsert(form) {
	parameters = {
		idGroupe : $(form + ' input[name="idGroupe"]').val(),
		texte : $(form + ' textarea').val(),
		image : ''
	}
	requeteAjaxParam("servlet/InsertMessage", parameters);
	$("#formConversation textarea").val('');
}

timer = undefined;
requeteAjax("servlet/SelectGroupe", displayGroupes);
setInterval("requeteAjax('servlet/SelectGroupe', displayGroupes)", 10000);

function displayGroupes(data) {
		var line;
		$("#discussions table tbody").empty();
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a onclick=\"majConversation(" + data.Groupes[i].idGroupe + ")\" class=\"btn\" data-toggle=\"modal\" data-target=\"#conversation\">\n";
		line += "\t\t\t<h4>" + data.Groupes[i].nom + "</h4>\n";
		line += "\t\t</a>\n";
		line += "\t</td>\n";
		line += "</tr>\n";
		$("#discussions table tbody").append(line);
	}
}

function displayConversation(data) {
	$("#messageArea .panel-body").empty();

	$('#myModalLabel').empty();
	$('#myModalLabel').append(data.Groupe.nom);

	$('#participant').empty();

	var line;
	for (var i = 0; i < data.Groupe.participants.length; i++) {
		line = "<div class=\"label label-danger\">";
		line += "<a onclick=\"\$(this).parent().remove()\">";
		line += "<span class=\"btn-danger glyphicon glyphicon glyphicon-remove-sign\"></span></a>";
		line += "<label>"+data.Groupe.participants[i].pseudo+"</label>";
		line += "</div>";
		$('#participant').append(line);
	}
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

function scrollDown() {
	var scrollBar = document.getElementById("messageArea");
	scrollBar.scrollTop = scrollBar.scrollHeight;
}

function checkEnter(form) {
	if (event.keyCode == 13) {
		doInsert(form);
	}
}

function delArea() {
	if (event.keyCode == 13) {
		$("#formConversation textarea").val('');
	}
}

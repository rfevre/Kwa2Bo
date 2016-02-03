$('#formConversation textarea').keypress(function (e) {
  if (e.which == 13) {
    $('#formConversation').submit();
    return false;    //<---- Add this line
  }
});

searchContact();
timer = undefined;
requeteAjax("servlet/SelectGroupe", displayGroupes);
setInterval("requeteAjax('servlet/SelectGroupe', displayGroupes)", 2000);

function displayGroupes(data) {
		var line;
		$("#discussions table tbody").empty();
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a onclick=\"majConversation(" + data.Groupes[i].idGroupe + ")\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#conversation\">\n";
		line += "\t\t\t<h4>" + data.Groupes[i].nom + "</h4>\n";
		line += "\t\t</a>\n";
		line += "\t</td>\n";
		line += "</tr>\n";
		$("#discussions table tbody").append(line);
	}
}

function displayConversation(data) {
	console.log(data);
	$("#messageArea .panel-body").empty();
	$('#myModalLabel').empty();
	$('#myModalLabel').append(data.Groupe.nom);
	$('#participants').empty();
	var line;
	for (var i = 0; i < data.Groupe.participants.length; i++) {
		line = "<div class=\"label label-danger\">";
		line += "<a onclick=\"\$(this).parent().remove(); removeUserToGroup(\'"+data.Groupe.participants[i].email+"\',"+data.Groupe.idGroupe+");\">";
		line += "<span class=\"btn-danger glyphicon glyphicon glyphicon-remove-sign\"></span></a> ";
		line += "<label>"+data.Groupe.participants[i].pseudo+"</label>";
		line += "</div>";
		$('#participants').append(line);
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
		if (data.Groupe.messages[i].image != "" && data.Groupe.messages[i].image != "null") {
			line += "<br/><img width=50 height=50 src=" + data.Groupe.messages[i].image + ' alt="" />';
		}
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

$(function () {
    $('#formConversation').on('submit', function (e) {
        // On empêche le navigateur de soumettre le formulaire
        e.preventDefault();

        var $form = $(this);
        var formdata = (window.FormData) ? new FormData($form[0]) : null;
        var data = (formdata !== null) ? formdata : $form.serialize();

        $.ajax({
            url: $form.attr('action'),
            type: $form.attr('method'),
            contentType: false, // obligatoire pour de l'upload
            processData: false, // obligatoire pour de l'upload
            dataType: 'json', // selon le retour attendu
            data: data,
            success: function (response) {
                // La réponse du serveur
            }
        });

		$("#formConversation textarea").val('');
		$('#formConversation input[name="image"]').val('');
		scrollDown();
    });
});

function scrollDown() {
	var scrollBar = document.getElementById("messageArea");
	scrollBar.scrollTop = scrollBar.scrollHeight;
}

function removeUserToGroup(mail,idGroupe) {
	requeteAjaxParam("servlet/DeleteUtilisateurGroupe", { "idGroupe" : idGroupe, "mail" : mail });
}

function addSuggestContact(data) {
	$("#contact-list").empty();
	var line = "";
	for (var i = 0; i < data.Utilisateur.contacts.length; i++) {
		line = "<li class=\"list-group-item\">\n";
		line +=	"\t<div class=\"col-sm-3\">\n";
		line +=	"\t\t<img src=\"res/profil/default.jpg\" class=\"img-responsive img-circle hidden-xs\"/>\n";
		line += "\t</div>\n";
		line += "\t<div class=\"col-xs-10 col-sm-7\">\n";
		line += "\t\t<label>"+ data.Utilisateur.contacts[i].pseudo +"</label>\n";
		line += "\t</div>\n";
		line += "\t<div>\n";
		line += "\t\t<a class=\"btn btn-success btn-sm col-xs-2 col-sm-2\" onclick=\"addMembre('" + data.Utilisateur.contacts[i].email + "', '" + data.Utilisateur.contacts[i].pseudo + "')\">\n";
		line += "\t\t\t<span class=\"glyphicon glyphicon-plus-sign\"/>\n";
		line += "\t\t</a>\n";
		line += "\t</div>\n";
		line += "\t<div class=\"clearfix\"></div>\n";
		line += "</li>\n";
		$("#contact-list").append(line);
	}
}

function searchContact() {
	var parameter = $("input[id=searchBar]").val();
	requeteAjaxParam("servlet/SelectContact", { critere : parameter }, addSuggestContact);
}

function addMembre(email, pseudo) {
	for (var i = 0; i < $("input[type=hidden][name=membre]").length; i++) {
		if ($("input[type=hidden][name=membre]")[i].value === email) {
			return null;
		}
	}
	var line = "";
	line = "<li>\n";
	line += "<div class=\"label label-danger\">\n";
	line += "<input type=hidden value=" + email + " name=\"membre\"/>\n";
	line +=	"<a onclick=\"$(this).parent().parent().remove()\">\n";
	line += "<span class=\"btn-danger glyphicon glyphicon glyphicon-remove-sign\"></span>\n";
	line += "</a>\n";
	line += pseudo;
	line += "</div>\n";
	line += "</li>\n";
	$("#membres ul").append(line);
}

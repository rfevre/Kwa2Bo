
function displayGroupes(data) {
		var line;
		console.log('lol');
		console.log(data);
	for (var i = 0; i < data.Groupes.length; i++) {
		line = "<tr>\n";
		line += "\t<td class=\"row\">\n";
		line += "\t\t<a href=\"#\" class=\"btn\">\n";
		line += "\t\t\t<h3>" + data.Groupes[i].nom + "</h3>\n";
		line += "\t\t</a>\n";
		line += "\t</td>\n";
		line += "</tr>\n";
		$("#discussions table tbody").append(line);
	}
}

/*function displayConversation(data) {
	// TODO
}
*/
requeteAjax("servlet/SelectGroupe", displayGroupes);
//requeteAjax("servlet/SelectConversation", displayConversation);
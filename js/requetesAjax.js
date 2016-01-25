
function getGroupes(callback) {
	$.getJSON("servlet/SelectGroupe", function(data) {
  		callback(data);
	});
}
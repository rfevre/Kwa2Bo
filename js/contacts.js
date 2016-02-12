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

// easter-egg
var colors = ["yellow", "pink", "black", "white", "blue", "green","Aqua","blueviolet","chartreuse","cyan","darkgray","darkmagenta","deeppink","firebrick","gold","indigo"];
var i = 0;
function changeColor(){
    $("body").css("background-color", colors[i]);
    if(i === colors.length-1){
      i = -1;
    }
    i++;
}
//Haut, haut, bas, bas, gauche, droite, gauche, droite, B, A
//var k = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65],n = 0;
// AMAZING
var k = [65, 77, 65, 90, 73, 78, 71],n = 0;
var int = undefined;
$(document).keydown(function (e) {
    if (e.keyCode === k[n++]) {
        if (n === k.length) {
            if (int == undefined){
              int = setInterval("changeColor()", 5);
            }else{
              clearInterval(int);
              int = undefined;
              $("body").css("background-color", "white");
            }
            n = 0;
            return false;
        }
    }
    else {
        n = 0;
    }
});

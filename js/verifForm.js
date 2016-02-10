function isNotEmpty(input) {
	var pseudo = input.value;
	return pseudo != "";
}

function addInfo(input, info) {
	$("#" + input.id).append("<div class=\"alert alert-warning\" role=\"alert\">"+ info +"</div>");
}

function removeInfo(input, info) {
	$("#" + input.id).children(".alert-warning").remove();
}

function updateStateOf(div,errorMsg) {
	if (isNotEmpty(div.firstElementChild.firstElementChild)) {
		div.className="has-success has-feedback";
		div.getElementsByTagName("span")[0].className="glyphicon glyphicon-ok form-control-feedback";
		removeInfo(div);
	}
	else {
		div.className="has-error has-feedback";
		div.getElementsByTagName("span")[0].className="glyphicon glyphicon-remove form-control-feedback";
		removeInfo(div);
		addInfo(div, errorMsg);
	}
}

function isMail(input) {
	var mail = input.value;
	var regex = new RegExp('^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$','i');
	return regex.test(mail);
}

function updateStateMail(div, errorMsg) {
	if (isMail(div.firstElementChild.firstElementChild)) {
		div.className="has-success has-feedback";
		div.getElementsByTagName("span")[0].className="glyphicon glyphicon-ok form-control-feedback";
		removeInfo(div);
	}
	else {
		div.className="has-error has-feedback";
		div.getElementsByTagName("span")[0].className="glyphicon glyphicon-remove form-control-feedback";
		removeInfo(div);
		addInfo(div, errorMsg);
	}
}

function verifForm() {
	var inputsNotEmpty = isNotEmpty(divPseudo) && isNotEmpty(divMail1.firstElementChild.firstElementChild) && isNotEmpty(divMail2.firstElementChild.firstElementChild) && isNotEmpty(divMdp1.firstElementChild.firstElementChild) && isNotEmpty(divMdp2.firstElementChild.firstElementChild);
	var isMail1 = isMail(divMail1.firstElementChild.firstElementChild);
	var isMail2 = isMail(divMail2.firstElementChild.firstElementChild);
	var mailsEquals = (divMail1.firstElementChild.firstElementChild.value == divMail2.firstElementChild.firstElementChild.value);
	var passwordsEquals = (divMdp1.firstElementChild.firstElementChild.value == divMdp2.firstElementChild.firstElementChild.value);
	var errorMsg = "";
	if (!inputsNotEmpty) {
		errorMsg += "Un ou plusieurs champs sont vides<br/>";
	}
	if (!mailsEquals) {
		errorMsg += "Les adresses mails sont différentes<br/>";
	}
	if (!passwordsEquals) {
		errorMsg += "Les mots de passes sont différents<br/>";
	}
	console.log(errorMsg);
	$("#inscription").children(".alert-danger").remove();
	if (errorMsg != "") {
		$("#inscription").append("<div class=\"alert alert-danger\" role=\"alert\"><strong>"+ errorMsg +"</strong></div>");
	}
	return (inputsNotEmpty && isMail1 && isMail2 && mailsEquals && passwordsEquals);
}

function isNotEmpty(input) {
	var pseudo = input.value;
	return pseudo != "";
}

function updateStateOf(div) {
	if (isNotEmpty(div.firstElementChild.firstElementChild)) {
		div.className="has-success has-feedback";
		div.lastElementChild.className="glyphicon glyphicon-ok form-control-feedback";
	}
	else {
		div.className="has-error has-feedback";
		div.lastElementChild.className="glyphicon glyphicon-remove form-control-feedback";
	}
}

function isMail(input) {
	var mail = input.value; 
	var regex = new RegExp('^[0-9a-z._-]+@{1}[0-9a-z.-]{2,}[.]{1}[a-z]{2,5}$','i');
	return regex.test(mail);
}

function updateStateMail(div) {
	if (isMail(div.firstElementChild.firstElementChild)) {
		div.className="has-success has-feedback";
		div.lastElementChild.className="glyphicon glyphicon-ok form-control-feedback";
	}
	else {
		div.className="has-error has-feedback";
		div.lastElementChild.className="glyphicon glyphicon-remove form-control-feedback";
	}
}
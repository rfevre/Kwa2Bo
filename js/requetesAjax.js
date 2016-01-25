
function requeteAjax(url, callback) {
	$.getJSON(url, function(data) {
  		callback(data);
	});
}

/*function requeteAjax(url, callback) {
	$.getJSON(url, function() {
	  console.log( "success" );
	})
	.done(function() {
		console.log( "second success" );
	})
	.fail(function() {
		console.log( "error" );
	})
	.always(function() {
	    console.log( "complete" );
	});
}*/
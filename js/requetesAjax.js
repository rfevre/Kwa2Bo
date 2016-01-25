
function requeteAjax(url, callback) {
	$.getJSON(url, function(data) {
  		callback(data);
	});
}

function requeteAjaxParam(url, parameters, callback) {
	$.get(url, parameters, function(data) {
  		callback(data);
	});
}

/*function requeteAjax(adresseUrl, callback) {
	$.ajax({
       url : adresseUrl,
       type : 'GET',
       dataType : 'json',
       success : function(data, statut){
           callback(data);
       },

       error : function(resultat, statut, erreur){
         console.log('erreur');
       },

       complete : function(resultat, statut){

       }
    });
}*/
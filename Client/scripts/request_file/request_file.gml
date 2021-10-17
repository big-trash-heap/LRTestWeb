
function request_file(url, dest){
	if(is_undefined(dest)){dest=url;}
	var http = http_get_file(url, dest);
	//ds_map_add(_requests, http, function(){} );
	return {http: http, response: function(func){ds_map_add(_requests, http, func );}};//http;
}

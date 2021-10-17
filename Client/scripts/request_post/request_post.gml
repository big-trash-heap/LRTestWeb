function request_post(url, data){
	var http = http_post_string(url, data);
	ds_map_add(_requests, http, function(){} );
	return {http: http, response: function(func){ds_map_add(_requests, http, func );}};//return http;
}

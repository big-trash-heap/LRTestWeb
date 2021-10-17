function request(url, header_map = {}, body = "", method = "GET"){
	var httpid;
	if(is_struct(header_map)){
		var map = ds_map_create();
		
		var keys = variable_struct_get_names(header_map), key, value;
		
		for(var i = 0; i < array_length(keys); i++){
			key = keys[i];
			value = variable_struct_get(header_map, key);
			
			if(is_struct(value)){value = json_stringify(value);}
			
			if(value != "" && value != undefined && value != noone) {ds_map_add(map, key, value);}
		}
		
		header_map = map;
		//show_message(json_encode(header_map))
		httpid = http_request(url, method, header_map, body);
		
		ds_map_destroy(header_map)
	}
	else{
		httpid = http_request(url, method, header_map, body);
	}
	
	//ds_map_add(_requests, http, function(){} );
	return {
		httpid: httpid, 
		response: function(func, data, json){
			//if(json == undefined) {json = true;}
			ds_map_add(_requests, httpid, {func: func, data: data, json: json});
			return {next: undefined};
		}
	};
	/*response: function(func){ds_map_add(_requests, httpid, func );}*/
	//return httpid;
}

/* Есть два варианта запроса, с параметрами и без:
	request_get(url) - запрос к url, подобно http_get
	request_get(url, struct) - запрос к url с заданными параметрами из структуры */
function request_get(url, params, clean){
	if(_host!=undefined && !clean){url=_host+url;}
	if(params==undefined) {params={};}
	params=struct_join(_data, params);
	url+=urlParams(params);
	//show_message_async(url)
	var httpid = http_get( url );
	var req={
		httpid: httpid, 
		response: function(func, data, json){
			if(json==undefined) {json=true;}
			ds_map_add(_requests, httpid, {func: func, data: data, json: json});
			return {next: undefined};
		}
	};
	
	return req;
}

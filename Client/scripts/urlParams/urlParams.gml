//Создаём строку url-параметров для запроса
function urlParamsMap(map){
	var txt="?", key=ds_map_find_first(map), value;
	repeat ds_map_size(map){
		value=map[?key];
		if(!is_undefined(value)){
			txt+=urlEncode(key)+"="+urlEncode(value)+"&";
		}
		key=ds_map_find_next(map, key);
	}
	return txt;
}

function urlParams(struct){
	var txt="?", keys=variable_struct_get_names(struct), value;
	for(var i=0; i<array_length(keys); i++){
		var key=keys[i], value=variable_struct_get(struct, key);
		if(!is_undefined(value)){
			txt+=urlEncode(key)+"="+urlEncode(value)+"&";
		}
	}
	return txt;
}

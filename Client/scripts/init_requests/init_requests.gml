//Инициализируем
//globalvar _requests, _host, _data;
_host=undefined;
_data={};
_requests=ds_map_create();

function jsonParse(json, error){
	try{
		var char = string_char_at(json, 1);
		if(char != "[" && char != "{"){throw "";}
		return json_parse(json);
	}
	catch(e){
		if is_method(error) {
			return error(e);
		}
		return undefined;
	}
}

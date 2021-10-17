
function request_add_data(struct){
	var arr_keys=variable_struct_get_names(struct), key;
	for(var i=0; i<array_length(arr_keys); i++){
		key=arr_keys[i];
		_data[$ key]=struct[$ key];
	}
}

function request_delete_data(arr_keys){
	var key;
	for(var i=0; i<array_length(arr_keys); i++){
		key=arr_keys[i];
		variable_struct_remove(_data, key);
	}
}

function request_get_data(){
	return _data;
}

function request_clear_data(){
	_data={};
}

function struct_join(struct_left, struct_right){
	var struct={};
	var arr_keys=variable_struct_get_names(struct_left), key;
	for(var i=0; i<array_length(arr_keys); i++){
		key=arr_keys[i];
		struct[$ key]=struct_left[$ key];
	}
	
	var arr_keys=variable_struct_get_names(struct_right), key;
	for(var i=0; i<array_length(arr_keys); i++){
		key=arr_keys[i];
		struct[$ key]=struct_right[$ key];
	}
	return struct;
}

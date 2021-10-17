//https://vk.com/clubgamemakerpro
//Обработка http запросов
function async_http(){
	//show_message_async(json_encode(async_load));
	try{
		var httpid = async_load[?"id"];
		if(ds_map_exists(_requests, httpid)){
			var req = _requests[?httpid];
		
			/*var res=async_load[? "result"];
			if(ds_map_exists(async_load, "result")){
			
			}else{
				req.func(async_load, req.data);
			}*/
			//show_message_async(json_encode(async_load));
			if(ds_map_exists(async_load, "result")){
				ds_map_delete(_requests, httpid);
				var res = async_load[? "result"];
				if(req[$ "json"] == true){
					res = jsonParse(async_load[? "result"]);
				}
				
				if(req[$ "json"] == undefined){
					var json = jsonParse(async_load[? "result"]);
					if(json != undefined){ res = json;}
				}
				req.func(res, req.data);
			}
		}
	}
	catch(e){show_debug_message(e);}
}



var _ip = "127.0.0.1";
//var _ip = "92.255.77.71";

self.socket = network_create_socket(network_socket_tcp); // [ip] + [port]
network_set_config(network_config_connect_timeout, 2000);
if (network_connect_raw(self.socket, _ip, 4571) <= 0) {
	
	show_error("Not server connect", true);
}

netTypeReadAppend(15,
	function(_buffer) {
		var _x = buffer_read(_buffer, buffer_s16);
		var _y = buffer_read(_buffer, buffer_s16);
		var _inst = instance_create_depth(_x, _y, 0, obj_player);
	}
);

netTypeReadAppend(10,
	function(_buffer) {
		obj_player.xx = buffer_read(_buffer, buffer_s16);
		obj_player.yy = buffer_read(_buffer, buffer_s16);
	}
);

netTypeWrite(1, buffer_sizeof(buffer_u8));
self.move_mask = -1;

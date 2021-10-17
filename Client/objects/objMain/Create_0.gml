
var _ip = "127.0.0.1";

self.socket = network_create_socket(network_socket_tcp); // [ip] + [port]
network_connect_raw(self.socket, _ip, 4571);

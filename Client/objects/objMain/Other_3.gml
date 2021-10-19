
var _buffer = buffer_create(buffer_sizeof(buffer_u8), buffer_grow, 1);
buffer_write(_buffer, buffer_u8, 255);
network_send_raw(self.socket, _buffer, buffer_tell(_buffer));
//network_destroy(self.socket);


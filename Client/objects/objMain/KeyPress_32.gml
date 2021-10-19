


var _buffer = buffer_create(1, buffer_grow, 1);
//buffer_write(_buffer, buffer_text, "sex");
buffer_write(_buffer, buffer_u8, 0);
buffer_write(_buffer, buffer_s16, 150);
network_send_raw(self.socket, _buffer, buffer_tell(_buffer));


buffer_delete(_buffer);

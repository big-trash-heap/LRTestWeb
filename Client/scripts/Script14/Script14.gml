

#region read

function netTypeReadAppend(_byte, _f) {
	static _map = __netTypeRead();
	_map[? _byte] = _f;
}

function netTypeReadCast() {
	static _map = __netTypeRead();
	var _buffer = async_load[? "buffer"];
	var _type = buffer_read(_buffer, buffer_u8);
	var _func = _map[? _type];
	_func(_buffer);
}

function __netTypeRead(_byte) {
	static _map = ds_map_create();
	return _map;
}

#endregion

#region write

function netTypeWrite(_byte, _size, _fixed=true, _alignment=1) {
	static _map = __netTypeWrite();
	var _buffer = buffer_create(_size + 1, _fixed, _alignment);
	buffer_write(_buffer, buffer_u8, _byte);
	_map[? _byte] = _buffer;
	return _byte;
}

function netTypeWriteCast(_byte, _socket, _f, _data) {
	static _map = __netTypeWrite();
	var _buffer = _map[? _byte];
	_f(_buffer, _data);
	network_send_raw(_socket, _buffer, buffer_tell(_buffer));
	buffer_seek(_buffer, buffer_seek_start, 1);
}

function __netTypeWrite() {
	static _map = ds_map_create();
	return _map;
}

#endregion


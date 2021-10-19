
var _move =
	( keyboard_check(ord("W")) << 0
	| keyboard_check(ord("A")) << 1
	| keyboard_check(ord("S")) << 2
	| keyboard_check(ord("D")) << 3
	);

if (_move != self.move_mask) {
	
	self.move_mask = _move;
	netTypeWriteCast(1, self.socket, 
		function(_buffer, _move) {
			buffer_write(_buffer, buffer_u8, _move);
		}, _move);
}

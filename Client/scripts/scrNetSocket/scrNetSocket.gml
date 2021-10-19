

#region class-NetConnect

function NetConnect(_ip="127.0.0.1", _port=4571) constructor {
	
	#region __private
	
	self.__ip   = _ip;
	self.__port = _port;
	
	#endregion
	
}

#endregion

#region class-NetSocket

global.__NetSocketMap = ds_map_create();

enum NET_SOCKET_ERROR { TIMEOUT };
//enum NET_SOCKET_DIS

function NetSocket(_type=network_socket_tcp) constructor {
	
	#region __private
	
	self.__socket_type = _type;
	self.__socket = undefined;
	self.__events = {}; /* connect(self), disconnect(self, code), error(self, code) */
	
	self.__isConnect = false;
	
	static __eventCast = function(_name) {
		
		var _event = self.__events[$ _name];
		if (_event != undefined) return _event;
		return functorEm;
	}
	
	#endregion
	
	static event = function(_name, _f) {
		
		self.__events[$ _name] = _f;
	}
	
	static connect = function(_netConnect) {
		
		if (self.__isConnect) {
			
			self.__isConnect = false;
			if (self.__socket != undefined) self.disconnect();
		}
		
		if (self.__socket == undefined) {
			
			self.__socket = network_create_socket(self.__socket_type);
			if (network_connect_raw(self.__socket, _netConnect.__ip, _netConnect.__port)) {
				
				self.__isConnect = true;
				self.__eventCast("connect")(self);
			}
			else {
				self.__eventCast("error")(self, NET_SOCKET_ERROR.TIMEOUT);
			}
		}
		
	}
	
	static disconnect = function() {
		
		
	}
	
}



#endregion


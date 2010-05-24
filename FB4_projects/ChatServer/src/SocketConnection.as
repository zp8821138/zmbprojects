package
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public class SocketConnection
	{
		
		private var _socket:Socket;
		private static var __socketList:Vector.<SocketConnection>=new Vector.<SocketConnection>;
		private static var __id:int=0;
		
		private var _userName:String="";
		
		public function SocketConnection(socket:Socket)
		{
			this.socket=socket;
			__socketList.push(this);
			
			socket.addEventListener(Event.CLOSE,eventHandler);
			socket.addEventListener(ProgressEvent.SOCKET_DATA,eventHandler);
			
			
			broadcastOnlineNum();
		}
		
		public static function broadcastMsg(msg:MsgPackger):void{
			for each(var v:SocketConnection in __socketList){
				v.sendPkg(msg);
			}
		}

		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}

		public function get socket():Socket
		{
			return _socket;
		}

		public function set socket(value:Socket):void
		{
			_socket = value;
		}
		
		private static function removeSocket(sc:SocketConnection):void{
			for(var i:int=0;i<__socketList.length;i++){
				if(__socketList[i]==sc){
					__socketList.splice(i,1);
					break;
				}
			}
		}
		
		private function eventHandler(event:Event):void{
			var pak:MsgPackger;
			
			switch(event.type){
				case Event.CLOSE:
					removeSocket(this);
					
					socket.removeEventListener(Event.CLOSE,eventHandler);
					socket.removeEventListener(ProgressEvent.SOCKET_DATA,eventHandler);
					
					ChatServer.outPut("A connection closed");
					
					pak=new MsgPackger;
					pak.msgType=MsgType.LOGOUT;
					pak.msgBody=this.userName;
					SocketConnection.broadcastMsg(pak);
					
					broadcastOnlineNum();
					break;
				case ProgressEvent.SOCKET_DATA:
					var bytes:ByteArray=new ByteArray;
					socket.readBytes(bytes);
					bytes.uncompress();
					
					unPkg(bytes.readObject());
					break;
			}
		}
		
		private function unPkg(obj:Object):void{
			var pak:MsgPackger;
			var date:Date;
			
			switch(obj.msgType){
				case MsgType.LOGIN:
					this.userName=obj.msgBody;
					ChatServer.outPut(this.userName+" connected");
					
					pak=new MsgPackger;
					pak.msgType=MsgType.LOGIN_HANDLER;
					pak.msgBody=this.userName;
					SocketConnection.broadcastMsg(pak);
					break;
				case MsgType.CHAT:
					pak=new MsgPackger;
					pak.userName=this.userName;
					
					date=new Date;
					pak.date=date.getHours()+":"+date.getMinutes();
					
					pak.msgBody=obj.msgBody;
					pak.msgType=MsgType.CHAT;
					
					SocketConnection.broadcastMsg(pak);
					break;
			}
		}
		
		private function sendPkg(value:MsgPackger):void{
			var bytes:ByteArray=new ByteArray;
			bytes.writeObject(value);
			bytes.compress();
			
			socket.writeBytes(bytes);
			socket.flush();
		}
		
		private function broadcastOnlineNum():void{
			var pak:MsgPackger=new MsgPackger;
			pak.msgType=MsgType.CURRENT_ONLINE_NUM;
			pak.msgBody=String(__socketList.length);
			SocketConnection.broadcastMsg(pak);
		}

	}
}
package com.xm.chatclient.net
{
	import com.xm.chatclient.user.User;
	import com.xm.chatclient.user.UserInfo;
	import com.xm.chatclient.views.ChatWindow;
	import com.xm.chatclient.views.ReqVideoChatAlert;
	import com.xm.chatclient.views.ReqVideoChatAlertEvent;
	import com.xm.chatclient.views.VideoChatWindow;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;

	public class ClientAPIs
	{
		public function ClientAPIs()
		{
		}
		
		public function userIDHandler(obj:Object):void{
			UserInfo.userInfo.userID=String(obj);
		}
		
		public function userListHandler(obj:Object):void{
			var chatClient:Red5ChatClient=FlexGlobals.topLevelApplication as Red5ChatClient;
			
			var sourceArr:Array=obj as Array;
			var arr:Array=[];
			while(sourceArr.length>0){
				var user:Object=sourceArr.shift();
				arr.push(new User(user.userName,user.userID));
			}
			
			chatClient.reBuildList(arr);
		}
		
		public function chatMsgHandler(msg:String,senderName:String,date:String):void{
			var chatClient:Red5ChatClient=FlexGlobals.topLevelApplication as Red5ChatClient;
			chatClient.outTxt.appendText(senderName+" "+date+":\n"+msg+"\n");
		}
		
		public function chatMsgFromHandler(senderName:String,senderID:String,msg:String,date:String):void{
			ChatWindow.receiveMsg(senderName,senderID,msg,date);
		}
		
		public function reqVideoChatHandler(senderID:String,senderName:String):void{
			ReqVideoChatAlert.show(senderName+"请求与你激情视频聊天，是否同意？","你好",videoChatReqAlertCloseHandler,senderID);
		}
		
		
		/**
		 * 准备好了进行视频聊天
		 * @param playID
		 * @param publishID
		 */
		public function readyForVideoChatHandler(playID:String,publishID:String):void{
			new VideoChatWindow().startChat(playID,publishID);
		}
		
		private function videoChatReqAlertCloseHandler(event:ReqVideoChatAlertEvent):void{
			if(event.detail==Alert.OK){
				var senderID:String=String(event.extData);
				
				NetConnectionManager.createVideoChatSession(senderID,UserInfo.userInfo.userID);
			}
		}
	}
}
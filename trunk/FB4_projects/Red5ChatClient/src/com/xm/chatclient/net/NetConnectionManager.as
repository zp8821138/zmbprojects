package com.xm.chatclient.net
{
	import com.xm.chatclient.Settings;
	import com.xm.chatclient.user.UserInfo;
	import com.xm.chatclient.views.LoginPanel;
	
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	
	import mx.core.Application;

	public final class NetConnectionManager
	{
		private static var __nc:NetConnection;
		
		public static function connectToRed5(userName:String):void{
			if(__nc==null){
				__nc=new NetConnection;
				__nc.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler);
				__nc.client=new ClientAPIs;
			}
			__nc.connect(Settings.CHAT_SERVER_URL,userName);
		}
		
		public static function get netConnetion():NetConnection{
			return __nc;
		}
		
		/**
		 * 向某人发送一条消息
		 */
		public static function sendChatMsg(targetUserID:String,targetUserName:String,msg:String):void{
			netConnetion.call(ServerApis.SEND_CHAT_MSG_TO,null,targetUserID,targetUserName,UserInfo.userInfo.userID,UserInfo.userInfo.userName,msg);
		}
		
		
		/**
		 * 向所有用户发送消息
		 */
		public static function sendMsgToAll(msg:String):void{
			netConnetion.call(ServerApis.SEND_CHAT_MSG_TO_ALL,null,UserInfo.userInfo.userID,UserInfo.userInfo.userName,msg);
		}
		
		/**
		 * 发送视频聊天的请求
		 * @param targetUserID	目标用户ID
		 * @param senderID		发送消息者用户ID
		 * @param senderName	发送消息者用户名称
		 */
		public static function reqVideoChat(targetUserID:String,senderID:String,senderName:String):void{
			netConnetion.call(ServerApis.REQ_VIDEO_CHAT,null,targetUserID,senderID,senderName);
		}
		
		public static function createVideoChatSession(userID1:String,userID2:String):void{
			netConnetion.call(ServerApis.CREATE_VIDEO_CHAT_SESSION,null,userID1,userID2);
		}
		
		private static function netStatusHandler(event:NetStatusEvent):void{
			trace(event.info.code);
			switch(event.info.code){
				case "NetConnection.Connect.Success":
					LoginPanel.show=false;
					LoginPanel.showMsg("");
					break;
				case "NetConnection.Connect.Failed":
					LoginPanel.showMsg("登陆失败，请稍候再试");
					break;
				case "NetConnection.Connect.Closed":
					LoginPanel.show=true;
					LoginPanel.showMsg("已经与服务器断开连接");
					break;
			}
		}
	}
}
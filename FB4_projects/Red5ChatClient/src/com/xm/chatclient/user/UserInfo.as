package com.xm.chatclient.user
{
	public final class UserInfo
	{
		public function UserInfo(inner:InnerClass)
		{
			if(inner==null){
				
				//不允许外部进行实例化
				throw new Error("此类无法在外部被实例化，你小子别尝试了");
			}
		}
		
		private static var __thisClass:UserInfo;
		private static var __innerClass:InnerClass;
		
		public static function get userInfo():UserInfo{
			if(__thisClass==null){
				__innerClass=new InnerClass;
				__thisClass=new UserInfo(__innerClass);
			}
			return __thisClass;
		}
		
		
		private var _userName:String="";

		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}
		
		private var _userID:String="";

		public function get userID():String
		{
			return _userID;
		}

		public function set userID(value:String):void
		{
			_userID = value;
		}


	}
}


class InnerClass{
}
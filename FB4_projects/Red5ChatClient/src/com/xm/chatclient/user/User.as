package com.xm.chatclient.user
{
	public class User
	{
		public function User(userName:String,userID:String)
		{
			this.userID=userID;
			this.userName=userName;
		}
		
		private var _userName:String="";
		
		private var _userID:String="";

		public function get userID():String
		{
			return _userID;
		}

		public function set userID(value:String):void
		{
			_userID = value;
		}

		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}

	}
}
package com.xm.chatclient.views
{
	public class ReqVideoChatAlertEvent
	{
		public function ReqVideoChatAlertEvent()
		{
		}
		
		private var _extData:Object;

		public function get extData():Object
		{
			return _extData;
		}

		public function set extData(value:Object):void
		{
			_extData = value;
		}
		
		private var _detail:int=-1;

		public function get detail():int
		{
			return _detail;
		}

		public function set detail(value:int):void
		{
			_detail = value;
		}


	}
}
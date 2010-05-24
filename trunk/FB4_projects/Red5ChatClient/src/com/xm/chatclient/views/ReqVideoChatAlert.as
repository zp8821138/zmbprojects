package com.xm.chatclient.views
{
	import mx.controls.Alert;
	import mx.events.CloseEvent;

	public class ReqVideoChatAlert
	{
		private var _extData:Object;
		private var _handler:Function;
		
		public function ReqVideoChatAlert(test:String,title:String,handler:Function=null,extData:Object=null)
		{
			this._extData=extData;
			this._handler=handler;
			Alert.show(test,title,Alert.OK|Alert.CANCEL,null,closeHandler);
		}
		
		private function closeHandler(event:CloseEvent):void{
			if(this._handler!=null){
				var rvcae:ReqVideoChatAlertEvent=new ReqVideoChatAlertEvent;
				rvcae.extData=this._extData;
				rvcae.detail=event.detail;
				this._handler(rvcae);
			}
		}
		
		public static function show(test:String,title:String,handler:Function=null,extData:Object=null):void{
			new ReqVideoChatAlert(test,title,handler,extData);
		}
	}
}
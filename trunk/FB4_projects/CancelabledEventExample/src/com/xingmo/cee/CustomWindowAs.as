package com.xingmo.cee
{
	import flash.display.DisplayObject;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;
	
	
	/**
	 * 在窗体关闭前触发此事件
	 */
	[Event(name="customWindowClosing",type="com.xingmo.cee.CustomWindowEvent")]
	
	/**
	 * 在窗体关闭后触发此事件
	 */
	[Event(name="customWindowClose",type="com.xingmo.cee.CustomWindowEvent")]
	
	public class CustomWindowAs extends TitleWindow
	{
		public function CustomWindowAs()
		{
			super();
			
			this.addEventListener(CloseEvent.CLOSE,closeHandler);
			this.width=400;
			this.height=300;
		}
		
		/**
		 * 弹出一个窗体
		 * @param	title	窗体的标题
		 */
		public static function show(title:String):CustomWindowAs{
			var win:CustomWindowAs=new CustomWindowAs;
			win.title=title;
			
			PopUpManager.addPopUp(win,FlexGlobals.topLevelApplication as DisplayObject);
			PopUpManager.centerPopUp(win);
			return win;
		}
		
		/**
		 * 关闭此窗体
		 */
		public function close():void{
			PopUpManager.removePopUp(this);
			dispatchEvent(new CustomWindowEvent(CustomWindowEvent.CUSTOM_WINDOW_CLOSE));
		}
		
		private function closeHandler(event:CloseEvent):void{
			if(dispatchEvent(new CustomWindowEvent(CustomWindowEvent.CUSTOM_WINDOW_CLOSING,false,true))){
				close();
			}
		}
	}
}
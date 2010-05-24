package com.xingmo.cee
{
	import flash.events.Event;
	
	public class CustomWindowEvent extends Event
	{
		
		public static const CUSTOM_WINDOW_CLOSING:String="customWindowClosing";
		
		public static const CUSTOM_WINDOW_CLOSE:String="customWindowClose";
		
		
		public function CustomWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new CustomWindowEvent(type,bubbles,cancelable);
		}
	}
}
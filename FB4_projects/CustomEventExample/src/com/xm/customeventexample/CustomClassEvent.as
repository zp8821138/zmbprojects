package com.xm.customeventexample
{
	import flash.events.Event;
	
	
	public class CustomClassEvent extends Event
	{
		public static const SAMPLE_EVENT:String="sampleEvent";
		
		
		
		private var _data:String="event:data";
		
		
		public function get data():String
		{
			return _data;
		}
		
		public function set data(value:String):void
		{
			_data = value;
		}
		
		public function CustomClassEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event{
			return new CustomClassEvent(type,bubbles,cancelable);
		}
	}
}
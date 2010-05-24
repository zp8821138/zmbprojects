package com.xm.customeventexample
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.setTimeout;
	
	
	[Event(name="sampleEvent",type="com.xm.customeventexample.CustomClassEvent")]
	
	public class CustomClass extends EventDispatcher
	{
		
		private var _data:Object="CC:aa";
		
		public function CustomClass()
		{
			setTimeout(disEvent,3000);
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		private function disEvent():void{
			dispatchEvent(new CustomClassEvent(CustomClassEvent.SAMPLE_EVENT));
		}
	}
}
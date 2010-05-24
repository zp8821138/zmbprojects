package com.xingmo.clockexample.controls
{
	import flash.events.Event;
	
	public class ClockEvent extends Event
	{
		
		public static const WAKE_UP:String="wakeUp";
		
		
		private var _currentDate:Date;
		
		
		public function ClockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		public function get currentDate():Date
		{
			return _currentDate;
		}

		internal function setCurrentDate(value:Date):void
		{
			_currentDate = value;
		}

		override public function clone():Event{
			return new ClockEvent(type,bubbles,cancelable);
		}
	}
}
package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class EventExample extends Sprite
	{
		public function EventExample()
		{
			//trace(stage.hasEventListener(Event.ACTIVATE));
			stage.addEventListener(Event.ACTIVATE,eventHandler);
			//trace(stage.hasEventListener(Event.ACTIVATE));
			
			stage.addEventListener(Event.DEACTIVATE,eventHandler);
			
			stage.addEventListener(MouseEvent.CLICK,this.clickStageHandler);
		}
		
		private function eventHandler(event:Event):void{
			trace(event);
		}
		
		private function clickStageHandler(event:MouseEvent):void{
			trace("你单击了场景");
		}
	}
}
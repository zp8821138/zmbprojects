package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MainApp extends Sprite
	{
		public function MainApp()
		{
			super();
			
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
		}
		
		private function mouseUpHandler(event:MouseEvent):void{
			trace(event.clickCount);
		}
	}
}
package
{
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite
	{
		private var win:NativeWindow;
		
		public function Main()
		{
			super();
			
			win=stage.nativeWindow;
			
			win.addEventListener(Event.CLOSING,nativeWindowClosingHandler);
		}
		
		private function nativeWindowClosingHandler(event:Event):void{
			event.preventDefault();
		}
	}
}
package
{
	import com.xm.dlle.DllLoader;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class DllExample extends Sprite
	{
		
		private var dllLoader:DllLoader;
		
		public function DllExample()
		{
			dllLoader=new DllLoader;
			dllLoader.addEventListener(Event.INIT,initHandler);
			dllLoader.load("res.swf");
		}
		
		private function initHandler(event:Event):void{
			var CircleClass:Class=dllLoader.getClass("com.res.MyBlueCircle");
			
			addChild(new CircleClass);
			
			
			var RectClass:Class=dllLoader.getClass("com.res.MyRedRect");
			var rect:DisplayObject=new RectClass;
			rect.y=100;
			addChild(rect);
			
			
			var HelloDllClass:Class=dllLoader.getClass("com.res.HelloDll");
			var helloDll:*=new HelloDllClass;
			trace(helloDll.sayHello("Heteng"));
		}
	}
}
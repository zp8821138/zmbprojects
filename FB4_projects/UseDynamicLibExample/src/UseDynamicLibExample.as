package
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class UseDynamicLibExample extends Sprite
	{
		private var loader:Loader;
		
		public function UseDynamicLibExample()
		{
			loader=new Loader;
			loader.contentLoaderInfo.addEventListener(Event.INIT,initHandler);
			loader.load(new URLRequest("ResourceLib.swf"));
		}
		
		private function initHandler(event:Event):void{
			//取得另外一个swf文件中的资源
			var ImageClass:Class=loader.contentLoaderInfo.applicationDomain.getDefinition("com.xm.res.CustomImage") as Class;
			
			var image:DisplayObject=new ImageClass;
			addChild(image);
		}
	}
}
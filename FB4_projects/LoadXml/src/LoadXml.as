package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class LoadXml extends Sprite
	{
		private var ul:URLLoader;
		private const DATA_FILE_PATH:String="data.xml";
		
		public function LoadXml()
		{
			ul=new URLLoader;
			ul.addEventListener(Event.COMPLETE,completeHandler);
			ul.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			ul.load(new URLRequest(DATA_FILE_PATH));
		}
		
		private function completeHandler(event:Event):void{
			var xml:XML=XML(event.target.data);
			trace(xml.classes[0].name);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void{
			trace(event);
		}
	}
}
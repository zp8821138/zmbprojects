package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class DisplayObjectExample extends Sprite
	{
		
		private var _loader:Loader=new Loader;
		
		public function DisplayObjectExample()
		{
			addChild(_loader);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
			_loader.load(new URLRequest("assets/lx.swf"));
		}
		
		private function progressHandler(event:ProgressEvent):void{
			
			trace(event.bytesLoaded,event.bytesTotal,int((event.bytesLoaded/event.bytesTotal)*10000)/100+"%");
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void{
			removeAllEventListeners();
			
			trace("找不到图片");
		}
		
		private function completeHandler(event:Event):void{
			removeAllEventListeners();
			
			trace(_loader.content);
		}
		
		private function removeAllEventListeners():void{
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeHandler);
		}
	}
}
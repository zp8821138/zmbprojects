package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.ProgressEvent;
	
	public class LoaderExample extends Sprite
	{
		
		private var _loader:Loader;
		
		public function LoaderExample()
		{
			_loader=new Loader;
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressHandler);
		}
		
		private function progressHandler(event:ProgressEvent):void{
			trace(event.bytesLoaded,event.bytesTotal);
		}
	}
}
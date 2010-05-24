package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.utils.ByteArray;
	
	public class LoadDataExample extends Sprite
	{
		private var _ul:URLLoader;
		
		public function LoadDataExample()
		{
			_ul=new URLLoader;
			_ul.dataFormat=URLLoaderDataFormat.BINARY;
			_ul.addEventListener(Event.COMPLETE,eventHandler);
			_ul.addEventListener(IOErrorEvent.IO_ERROR,eventHandler);
			_ul.load(new URLRequest("http://127.0.0.1/index.php"));
		}
		
		private function eventHandler(event:Event):void{
			switch(event.type){
				case Event.COMPLETE:
					var bytes:ByteArray=_ul.data;
					//将当前指针位置设置为0，则后面的操作将从0位置开始读取此字节数组
					bytes.position=0;
					//以指定的编码方式来读取此字节数组
					trace(bytes.readMultiByte(bytes.bytesAvailable,"gb2312"));
					break;
				case IOErrorEvent.IO_ERROR:
					trace("找不到页面");
					break;
			}
			
		}
	}
}
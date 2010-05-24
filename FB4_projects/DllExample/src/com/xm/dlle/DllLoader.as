package com.xm.dlle
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	
	
	[Event(name="complete",type="flash.events.Event")]
	[Event(name="init",type="flash.events.Event")]
	[Event(name="open",type="flash.events.Event")]
	[Event(name="unload",type="flash.events.Event")]
	[Event(name="httpStatus",type="flash.events.HTTPStatusEvent")]
	[Event(name="ioError",type="flash.events.IOErrorEvent")]
	[Event(name="progress",type="flash.events.ProgressEvent")]
	
	public class DllLoader extends EventDispatcher
	{
		
		private var _loader:Loader;
		
		public function DllLoader()
		{
			_loader=new Loader;
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,eventHandler);
			_loader.contentLoaderInfo.addEventListener(Event.INIT,eventHandler);
			_loader.contentLoaderInfo.addEventListener(Event.OPEN,eventHandler);
			_loader.contentLoaderInfo.addEventListener(Event.UNLOAD,eventHandler);
			_loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,eventHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,eventHandler);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,eventHandler);
		}
		
		
		public function load(url:String):void{
			_loader.load(new URLRequest(url));
		}
		
		
		/**
		 * 从所加载的swf文件中取得一个类
		 * @param name	类的全路径名称
		 * @return
		 */
		public function getClass(name:String):Class{
			return _loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
		}
		
		private function eventHandler(event:Event):void{
			dispatchEvent(event);
		}
	}
}
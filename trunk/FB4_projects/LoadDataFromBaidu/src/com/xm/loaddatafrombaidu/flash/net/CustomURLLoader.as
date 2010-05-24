package com.xm.loaddatafrombaidu.flash.net
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class CustomURLLoader extends URLLoader
	{
		public function CustomURLLoader(request:URLRequest=null)
		{
			super(request);
		}
	}
}
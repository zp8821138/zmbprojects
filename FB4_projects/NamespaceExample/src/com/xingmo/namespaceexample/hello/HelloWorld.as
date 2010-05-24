package com.xingmo.namespaceexample.hello
{
	import com.xingmo.namespaceexample.xing_mo;

	public class HelloWorld
	{
		use namespace xing_mo;
		
		public function HelloWorld()
		{
		}
		
		xing_mo function hello():void{
			trace("Hello xingmo");
		}
		
	}
}
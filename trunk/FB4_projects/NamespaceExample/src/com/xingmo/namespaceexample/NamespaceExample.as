package com.xingmo.namespaceexample 
{
	import com.xingmo.namespaceexample.hello.HelloWorld;
	
	import flash.display.Sprite;
	
	public class NamespaceExample extends Sprite
	{
		use namespace xing_mo;
		
		public function NamespaceExample()
		{
			var world:HelloWorld=new HelloWorld;
			world.xing_mo::hello();
		}
	}
}



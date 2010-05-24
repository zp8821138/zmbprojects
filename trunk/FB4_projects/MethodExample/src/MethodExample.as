package
{
	import flash.display.Sprite;
	
	public class MethodExample extends Sprite
	{
		public function MethodExample()
		{
			sayWords();
			sayWords("Hello xingmo");
		}
		
		//这是AS3语言中所支持的类似于方法重载的东西
		public function sayWords(value:String="Hello World"):void{
			trace(value);
		}
		
		
		/*这是正宗的方法重载，但是AS3不支持
		public function sayWords():void{
			trace("Hello World");
		}
		
		public function sayWords(value:String):void{
			trace(value);
		}
		*/
	}
}
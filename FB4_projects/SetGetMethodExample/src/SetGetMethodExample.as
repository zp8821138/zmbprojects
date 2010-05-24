package
{
	import flash.display.Sprite;
	
	public class SetGetMethodExample extends Sprite
	{
		public function SetGetMethodExample()
		{
			var my:MyClass=new MyClass;
			//my.myString="111";
		}
	}
}


class MyClass{
	
	private var _myString:String="Hello";

	public function get myString():String
	{
		return _myString;
	}

	public function set myString(value:String):void
	{
		_myString = value;
	}
}
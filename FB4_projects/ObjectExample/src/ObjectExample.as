package
{
	import flash.display.Sprite;

	
	public class ObjectExample extends Sprite
	{
		
		public function ObjectExample()
		{
			var c:MyClass=new MyClass();
			
			c.value="aaaaaa";
			trace(c.value);
		}

	}
}


class MyClass{
	
	private var _value:String="";
	
	public function MyClass(){
		trace(value);
	}
	
	public function get value():String
	{
		return _value;
	}

	public function set value(value:String):void
	{
		_value = value;
	}
}
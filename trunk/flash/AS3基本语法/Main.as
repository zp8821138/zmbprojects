package{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Main extends Sprite{
		private var txt:TextField;
		private var s:MySprite=new MySprite;
		
		public function Main(){
			trace(s);
		}
	}
}


import flash.display.Sprite;
dynamic class MySprite extends Sprite{
	
	
	override public function toString():String{
		return "aaa";
	}
}
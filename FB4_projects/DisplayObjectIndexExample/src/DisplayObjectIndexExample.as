package
{
	import flash.display.Sprite;
	
	public class DisplayObjectIndexExample extends Sprite
	{
		public function DisplayObjectIndexExample()
		{
			for(var i:int=0;i<10;i++){
				addChild(new ColorDisplayObject(uint(Math.random()*0xFFFFFF)));
			}
		}
	}
}
package
{
	import flash.display.Sprite;

	public class RandomExample extends Sprite
	{
		public function RandomExample()
		{
			for (var i:int=0; i < 10; i++)
			{
				trace(CustomMath.random(100, 200));
			}
		}
	}
}
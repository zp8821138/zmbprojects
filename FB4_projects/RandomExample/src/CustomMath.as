package
{
	public final class CustomMath
	{
		
		public static function random(startNum:int=0,endNum:int=1):Number{
			return Math.random()*(endNum-startNum)+startNum;
		}
		
	}
}
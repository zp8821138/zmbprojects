package
{
	public class MyObject
	{
		
		private static var __id:int=0;
		
		public const MY_CONSTANT:String="myConstant";
		
		private  var _id:int;
		public function MyObject()
		{
			_id=__id;
			__id++;
		}
		
		public function get id():int{
			return _id;
		}
	}
}
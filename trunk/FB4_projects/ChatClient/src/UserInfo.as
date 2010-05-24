package
{
	public class UserInfo
	{
		public function UserInfo()
		{
		}
		
		private static var _userID:String="";

		public static function get userID():String
		{
			return _userID;
		}

		public static function set userID(value:String):void
		{
			_userID = value;
		}

	}
}
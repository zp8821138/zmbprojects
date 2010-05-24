package
{
	import com.xingmo.interfaceexample.IPeople;
	
	public class Teacher implements IPeople
	{
		public function Teacher()
		{
		}
		
		public function say():void
		{
			trace("I'm a teacher");
		}
		
		public function get sex():String
		{
			return null;
		}
		
		public function get age():int
		{
			return 40;
		}
		
		public function get work():String
		{
			return "Teacher";
		}
	}
}
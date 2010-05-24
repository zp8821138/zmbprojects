package
{
	import com.xingmo.interfaceexample.IPeople;
	
	public class Student implements IPeople
	{
		public function Student()
		{
			
		}
		
		public function say():void
		{
			trace("I'm a student");
		}
		
		public function get sex():String
		{
			return null;
		}
		
		public function get age():int
		{
			return 20;
		}
		
		public function get work():String{
			return "Student";
		}
	}
}
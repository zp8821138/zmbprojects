package
{
	import com.xingmo.interfaceexample.IPeople;
	
	import flash.display.Sprite;
	
	public class InterfaceExample extends Sprite
	{
		
		private var p:IPeople;
		
		public function InterfaceExample()
		{
			p=new Student;
			trace(getWork(p));
			//p.say();
			p=new Teacher;
			trace(getWork(p));
			//p.say();
		}
		
		private function getWork(people:IPeople):String{
			return people.work;
		}
	}
}
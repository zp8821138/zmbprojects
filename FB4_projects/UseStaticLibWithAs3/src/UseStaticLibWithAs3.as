package
{
	import com.xm.libs.HelloStaticLib;
	
	import flash.display.Sprite;
	
	public class UseStaticLibWithAs3 extends Sprite
	{
		public function UseStaticLibWithAs3()
		{
			var lib:HelloStaticLib=new HelloStaticLib;
			trace(lib.getLibName());
		}
	}
}
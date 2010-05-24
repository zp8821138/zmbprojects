package
{
	import com.xm.customeventexample.CustomClass;
	import com.xm.customeventexample.CustomClassEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CustomEventExample extends Sprite
	{
		
		public function CustomEventExample()
		{
			var cc:CustomClass=new CustomClass;
			cc.addEventListener(CustomClassEvent.SAMPLE_EVENT,sampleEventHandler);
		}
		
		private function sampleEventHandler(event:CustomClassEvent):void{
			trace(event.data);
			trace(event.target.data);
		}
	}
}
package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class VectorExample extends Sprite
	{
		private var vec:Vector.<MyObject>=new Vector.<MyObject>;
		
		public function VectorExample()
		{
			for(var i:int=0;i<100;i++){
				vec.push(new MyObject);
			}
			
			while(vec.length){
				trace(vec.pop().id);
			}
			
		}
	}
}
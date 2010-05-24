package{
	import flash.display.Sprite;
	
	public class MovieClipExample extends Sprite{
		
		public function MovieClipExample(){
			for(var i:int=0;i<5;i++){
				var mc:Ball=new Ball;
				addChild(mc);
				
				mc.x=i*100;
			}
		}
	}
}
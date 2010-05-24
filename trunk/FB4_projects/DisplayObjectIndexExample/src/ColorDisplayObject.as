package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class ColorDisplayObject extends Sprite
	{
		public function ColorDisplayObject(color:uint)
		{
			super();
			
			this.graphics.beginFill(color);
			this.graphics.drawRect(0,0,100,100);
			this.graphics.endFill();
			
			this.addEventListener(MouseEvent.MOUSE_DOWN,mouseEventHandler);
		}
		
		private function mouseEventHandler(event:MouseEvent):void{
			switch(event.type){
				case MouseEvent.MOUSE_DOWN:
					this.parent.setChildIndex(this,this.parent.numChildren-1);
					
					this.startDrag();
					
					stage.addEventListener(MouseEvent.MOUSE_UP,mouseEventHandler);
					break;
				case MouseEvent.MOUSE_UP:
					this.stopDrag();
					
					stage.removeEventListener(MouseEvent.MOUSE_UP,mouseEventHandler);
					break;
			}
		}
	}
}
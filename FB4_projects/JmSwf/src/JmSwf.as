package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class JmSwf extends Sprite
	{
		[Embed(source="FlexFile.swf")]
		protected var SwfFileClass:Class;
		
	
		public function JmSwf()
		{
			addChild(new SwfFileClass as DisplayObject);
		}
	}
}
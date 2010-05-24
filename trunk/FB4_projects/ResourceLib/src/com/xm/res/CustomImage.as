package com.xm.res
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class CustomImage extends Sprite
	{
		
		[Embed(source="fj.jpg")]
		private var ImageClass:Class;
		
		public function CustomImage()
		{
			var image:DisplayObject=new ImageClass as  DisplayObject;
			image.width=400;
			image.scaleY=image.scaleX;
			addChild(image);
		}
	}
}
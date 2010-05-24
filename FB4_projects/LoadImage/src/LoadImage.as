package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class LoadImage extends Sprite
	{
		private var _loader:Loader;
		
		public function LoadImage()
		{
			_loader=new Loader;
			_loader.load(new URLRequest("http://www.nusphere.com/php/php_images/zend_framework_code_insight_small.png"));
			addChild(_loader);
		}
	}
}
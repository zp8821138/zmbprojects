package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class GetPathValue extends Sprite
	{
		//private var txt:TextField=new TextField;
		//http://www.ccots.com.cn/userfiles/image/2009/02/20090216135222.jpg
		public function GetPathValue()
		{
			//txt.border=true;
			//addChild(txt);
			
			var obj:Object=root.loaderInfo.parameters;
			
			var loader:Loader=new Loader;
			var url:String=obj.path;
			if(url!=null){
				loader.load(new URLRequest(url));
			}
			
			addChild(loader);
		}
	}
}
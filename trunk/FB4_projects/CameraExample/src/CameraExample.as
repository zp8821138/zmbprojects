package
{
	import com.adobe.JPEGEncoder;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.net.FileReference;
	
	public class CameraExample extends Sprite
	{
		
		private var camera:Camera;
		private var video:Video;
		private var jpg:JPEGEncoder;
		
		public function CameraExample()
		{
			camera=Camera.getCamera();
			video=new Video;
			addChild(video);
			
			if(camera!=null){
				video.attachCamera(camera);
			}else{
				trace("找不到摄像头");
			}
			
			
			stage.addEventListener(MouseEvent.CLICK,clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void{
			var bitmapData:BitmapData=new BitmapData(video.width,video.height);
			bitmapData.draw(video);
			
			
			jpg=new JPEGEncoder(70);
			
			var fr:FileReference=new FileReference;
			fr.save(jpg.encode(bitmapData),"cut.jpg");
		}
	}
}
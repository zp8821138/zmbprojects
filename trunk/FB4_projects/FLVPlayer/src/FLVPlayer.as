package
{
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.describeType;
	
	[SWF(width="640",height="480")]
	public class FLVPlayer extends Sprite
	{
		
		private var _video:Video;
		private var _url:String="guestbook.flv";
		private var conn:NetConnection=new NetConnection;
		private var _netStream:NetStream;
		
		public function FLVPlayer()
		{
			_video=new Video(640,480);
			addChild(_video);
			
			conn.connect(null);
			_netStream=new NetStream(conn);
			
			_video.attachNetStream(_netStream);
			
			_netStream.client=this;
			_netStream.play(_url);
			
			stage.doubleClickEnabled=true;
			stage.addEventListener(MouseEvent.DOUBLE_CLICK,doubleCLickHandler);
		}
		
		public function onMetaData(obj:Object):void{
			for(var i:String in obj){
				trace(i,obj[i]);
			}
		}
		
		private function doubleCLickHandler(event:MouseEvent):void{
			if(stage.displayState==StageDisplayState.NORMAL){
				stage.displayState=StageDisplayState.FULL_SCREEN;
			}else{
				stage.displayState=StageDisplayState.NORMAL;
			}
			
		}
	}
}
package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	public class XMLExample extends Sprite
	{
		
		private var xml:XML;
		
		public function XMLExample()
		{
			//xml=<data><value>aaa</value></data>;
			
			xml=new XML(<data></data>);
			//trace(getQualifiedClassName(xml));
			//xml.appendChild(<value>hello</value>);
			//xml.value[xml.value.length()]="i";
			//xml.value.gg.@a="aaa";
			
//			for(var i:int=0;i<10;i++){
//				xml.value[i]=i;
//			}
//			trace(xml);
			
			//修改
//			xml.value[0]="h";
//			xml.value[1]="a";
//			trace(xml);
//			xml.value[0]="g";
//			trace(xml);
			
			
			xml.value[0]="h";
			xml.value[1]="l";
			xml.value[2]="l";
			xml.value[3]="o";
			
			
			for(var i:int=xml.value.length()-1;i>=1;i--){
				xml.value[i+1]=String(xml.value[i]);
			}
			
			xml.value[1]="e";
			
			trace(xml);
			
			stage.addEventListener(MouseEvent.CLICK,stageClickHandler);
		}
		
		
		private function stageClickHandler(event:MouseEvent):void{
			var fr:FileReference=new FileReference;
			
			
			var bytes:ByteArray=new ByteArray;
			bytes.writeMultiByte(xml.toString(),"utf-8");
			
			fr.save(bytes,"mydata.xml");
		}
	}
}
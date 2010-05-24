package
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class ByteArrayExample extends Sprite
	{
		public function ByteArrayExample()
		{
			var bytes:ByteArray=new ByteArray;
			bytes.writeInt(8);
//			trace("length:"+bytes.length);
//			trace("bytesAvailable:"+bytes.bytesAvailable);
//			trace("position:"+bytes.position);
			bytes.position=0;
			bytes.endian=Endian.LITTLE_ENDIAN;
			trace(bytes.readInt());

		}

		private function traceBytes(bytes:ByteArray):void
		{
			while (bytes.bytesAvailable)
			{
				trace(bytes.readByte());
			}
		}

	}
}
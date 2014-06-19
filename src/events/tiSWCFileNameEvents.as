package events
{
	import flash.events.Event;

	public class tiSWCFileNameEvents extends Event
	{
		public var fileName:String
		public var fileNativePath:String
		public function tiSWCFileNameEvents(type:String,fileName:String,fileNativePath:String)
		{
			super(type);
			this.fileName=fileName
			this.fileNativePath=fileNativePath;	
		}
		override public function clone():Event
		{
			return new tiSWCFileNameEvents(type,fileName,fileNativePath);
		}
	}
}
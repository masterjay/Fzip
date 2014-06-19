package events
{
	import flash.events.Event;
	
	public class tiCompleteEvents extends Event
	{
		public var id:String;
		public var fileName:String
		public var fileNativePath:String
		public function tiCompleteEvents(type:String,id:String,fileName:String,fileNativePath:String)
		{
			super(type);
			this.id=id;
			this.fileName=fileName
			this.fileNativePath=fileNativePath	
			
		}
		override public function clone():Event
		{
			return new tiCompleteEvents(type,id,fileName,fileNativePath);
		}
	}
}
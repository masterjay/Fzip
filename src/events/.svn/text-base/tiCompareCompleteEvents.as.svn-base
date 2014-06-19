package events
{
	import flash.events.Event;

	public class tiCompareCompleteEvents extends Event
	{
		public var count:int=0
		public function tiCompareCompleteEvents(type:String,count:int)
		{
			super(type);
			this.count=count
		}
		override public function clone():Event
		{
			return new tiCompareCompleteEvents(type,count);
		}
	}
}
package core.events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class NotificationEvent extends Event
	{
		public static const NOTICE_LAYER:String = "noticeLayer";
		
		public var sendEvent:Event;
		//public var sendEventConstant:String;
		
		public function NotificationEvent(type:String, sendEvent:Event, bubbles:Boolean = false, data:Object = null) 
		{
			super(type, bubbles, data);
			
			this.sendEvent = sendEvent;
			//this.sendEventConstant = sendEventConstant;, sendEventConstant:String
		}
		
	}

}
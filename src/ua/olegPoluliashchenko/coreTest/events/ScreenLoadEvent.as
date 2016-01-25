package ua.olegPoluliashchenko.coreTest.events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ScreenLoadEvent extends Event
	{
		public static const SCREEN_LOAD:String = "screenLoad";
		
		public function ScreenLoadEvent(type:String, bubbles:Boolean = false, data:Object = null) 
		{
			super(type, bubbles, data);
		}
		
	}

}
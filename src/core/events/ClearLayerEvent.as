package core.events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ClearLayerEvent extends Event
	{
		public static const CLEAR_LAYER:String = "clearLayer";
		public static const SET_VISIBLE_LAYER:String = "setVisibleLayer";
		
		public function ClearLayerEvent(type:String, bubbles:Boolean = false, data:Object = null) 
		{
			super(type, bubbles, data);
		}
		
	}

}
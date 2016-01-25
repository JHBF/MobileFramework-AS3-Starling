package core.screens 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ScreensStorage 
	{
		private var _screensClassesList:Dictionary;
		
		public function ScreensStorage(screensList:Dictionary)
		{
			_screensClassesList = screensList;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function getScreensClasses(screensConstants:String):ScreenVO 
		{
			return _screensClassesList[screensConstants];
		}
		
	}

}
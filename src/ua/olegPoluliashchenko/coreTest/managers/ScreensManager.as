package ua.olegPoluliashchenko.coreTest.managers 
{
	import core.screenManager.ScreenManager;
	import core.layers.LayersStorage;
	import core.screens.ScreensStorage;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ScreensManager extends ScreenManager
	{
		
		public function ScreensManager() 
		{
			var layers:Layers = new Layers();
			var layersStorage:LayersStorage = new LayersStorage(layers.layersList);
			
			var screen:Screens = new Screens();
			var screensStorage:ScreensStorage = new ScreensStorage(screen.screensList);
			
			var startedScreensList:Vector.<String> = new Vector.<String>();
			startedScreensList.push(ScreensConstants.MAIN_MENU_SCREEN, ScreensConstants.FIRST_SCREEN, ScreensConstants.SECOND_SCREEN, ScreensConstants.THIRD_SCREEN);
			super(startedScreensList, screensStorage, layersStorage);
		}
		
	}

}
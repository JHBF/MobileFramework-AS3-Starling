package ua.olegPoluliashchenko.coreTest.managers 
{
	import ua.olegPoluliashchenko.coreTest.managers.LayersConstants;
	import core.screens.ScreenVO;
	import flash.utils.Dictionary;
	import ua.olegPoluliashchenko.coreTest.controller.MainMenuController;
	import ua.olegPoluliashchenko.coreTest.model.MainMenuModel;
	import ua.olegPoluliashchenko.coreTest.view.FirstView;
	import ua.olegPoluliashchenko.coreTest.view.FourthView;
	import ua.olegPoluliashchenko.coreTest.view.MainMenuView;
	import ua.olegPoluliashchenko.coreTest.view.SecondView;
	import ua.olegPoluliashchenko.coreTest.view.ThirdView;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class Screens 
	{
		private var _screensList:Dictionary;
		
		public function Screens()
		{
			_screensList = new Dictionary();
			
			_screensList[ScreensConstants.MAIN_MENU_SCREEN] = new ScreenVO(MainMenuView, MainMenuController, MainMenuModel, LayersConstants.BACKGROUND_LAYER);
			_screensList[ScreensConstants.FIRST_SCREEN] = new ScreenVO(FirstView, MainMenuController, MainMenuModel, LayersConstants.TOP_LAYER);
			_screensList[ScreensConstants.SECOND_SCREEN] = new ScreenVO(SecondView, MainMenuController, MainMenuModel, LayersConstants.DOWN_LAYER);
			_screensList[ScreensConstants.THIRD_SCREEN] = new ScreenVO(ThirdView, MainMenuController, MainMenuModel, LayersConstants.CENTER_LAYER);
			
			_screensList[ScreensConstants.FOURTH_SCREEN] = new ScreenVO(FourthView, MainMenuController, MainMenuModel, LayersConstants.BACKGROUND_LAYER);
			_screensList[ScreensConstants.FIFTH_SCREEN] = new ScreenVO(FourthView, MainMenuController, MainMenuModel, LayersConstants.TOP_LAYER);
			_screensList[ScreensConstants.SIXTH_SCREEN] = new ScreenVO(FourthView, MainMenuController, MainMenuModel, LayersConstants.DOWN_LAYER);
			_screensList[ScreensConstants.SEVENTH_SCREEN] = new ScreenVO(FourthView, MainMenuController, MainMenuModel, LayersConstants.CENTER_LAYER);
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get screensList():Dictionary 
		{
			return _screensList;
		}
		
	}

}
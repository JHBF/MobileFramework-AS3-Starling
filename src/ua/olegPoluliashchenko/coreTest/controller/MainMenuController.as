package ua.olegPoluliashchenko.coreTest.controller 
{
	import core.baseClasses.Controller;
	import core.baseClasses.IController;
	import core.events.ClearLayerEvent;
	import core.events.NotificationEvent;
	import core.events.ScreenChangeEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import ua.olegPoluliashchenko.coreTest.events.ScreenLoadEvent;
	import ua.olegPoluliashchenko.coreTest.managers.LayersConstants;
	import ua.olegPoluliashchenko.coreTest.model.MainMenuModel;
	import ua.olegPoluliashchenko.coreTest.view.MainMenuView;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class MainMenuController extends Controller implements IController 
	{
		
		public function MainMenuController()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		// OVERRIDDEN METHODS
		//
		//--------------------------------------------------------------------------
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		override public function addListeners():void
		{
			currentViewClass.addEventListener(TouchEvent.TOUCH, currentViewClass_touchHandler);
			
			super.addListeners();
		}
		
		override public function removeListeners():void
		{
			currentViewClass.removeEventListener(TouchEvent.TOUCH, currentViewClass_touchHandler);
			
			super.removeListeners();
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION
		//
		//--------------------------------------------------------------------------
		
		private function currentViewClass_touchHandler(event:TouchEvent):void 
		{
			var touch:Touch = event.getTouch(currentViewClass);
			
			if (touch && (touch.phase == TouchPhase.ENDED))
			{
				currentViewClass.dispatchEvent(new NotificationEvent(NotificationEvent.NOTICE_LAYER, new ScreenLoadEvent(ScreenLoadEvent.SCREEN_LOAD, false, { msg:"New screen is " + currentViewClass.nextScreen } )));
				//currentViewClass.dispatchEvent(new ClearLayerEvent(ClearLayerEvent.CLEAR_LAYER, false, { layer:LayersConstants.DOWN_LAYER }));
				//currentViewClass.dispatchEvent(new ClearLayerEvent(ClearLayerEvent.SET_VISIBLE_LAYER, false, { layer:LayersConstants.DOWN_LAYER }));
				currentViewClass.dispatchEvent(new ScreenChangeEvent(ScreenChangeEvent.SCREEN_CHANGE, currentViewClass.nextScreen));
			}
		}
		
	}

}
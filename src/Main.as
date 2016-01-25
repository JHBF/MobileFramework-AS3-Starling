package
{
	import core.baseClasses.Model;
	import core.screenManager.ScreenManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import ua.olegPoluliashchenko.coreTest.managers.ScreensManager;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class Main extends Sprite 
	{
		private var mStarling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			startStarling();
		}
		
		private function startStarling():void 
		{
			var viewPort:Rectangle = new Rectangle(0, 0, this.stage.fullScreenWidth, this.stage.fullScreenHeight);
			
			mStarling = new Starling(ScreensManager, stage, viewPort);
			mStarling.antiAliasing = 1;
			//mStarling.showStats = true;
			mStarling.start();
		}
		
	}
	
}
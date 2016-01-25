package ua.olegPoluliashchenko.coreTest.view 
{
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	import ua.olegPoluliashchenko.coreTest.managers.ScreensConstants;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ThirdView extends View implements IView 
	{
		
		public function ThirdView() 
		{
			super();
			
		}
		
		//--------------------------------------------------------------------------
		//
		// OVERRIDDEN METHODS
		//
		//--------------------------------------------------------------------------
		
		override public function scrceenIn():void
		{
			var quad:Quad = new Quad(720, 390, 0xE8C5F3);
			this.addChild(quad);
			
			var textField:TextField = new TextField(200, 50, Starling.current.nativeStage.stageWidth + " " + Starling.current.nativeStage.stageHeight, "Verdana", 22, 0x000000);
			this.addChild(textField);
			
			super.scrceenIn();
		}
		
		override public function addListeners():void
		{
			
			super.addListeners();
		}
		
		override public function removeListeners():void
		{
			super.removeListeners();
		}
		
		override public function disposeView():void
		{
			
			super.disposeView();
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get nextScreen():String
		{
			return ScreensConstants.SEVENTH_SCREEN;
		}
		
	}

}
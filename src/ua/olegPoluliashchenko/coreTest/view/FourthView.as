package ua.olegPoluliashchenko.coreTest.view 
{
	import core.baseClasses.IModel;
	import core.baseClasses.IController;
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import starling.display.Quad;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class FourthView extends View implements IView 
	{
		
		public function FourthView() 
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
			var quad:Quad = new Quad(720, 10, 0xFB0006);
			this.addChild(quad);
			
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
			return "";
		}
		
	}

}
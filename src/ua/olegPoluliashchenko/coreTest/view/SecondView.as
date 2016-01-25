package ua.olegPoluliashchenko.coreTest.view 
{
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import starling.display.Quad;
	import ua.olegPoluliashchenko.coreTest.managers.ScreensConstants;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class SecondView extends View implements IView 
	{
		
		public function SecondView() 
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
			//var textureAtlas:TextureAtlas = EmbeddedAssets.textureAtlas;
			//var backgroundTexture:Texture = textureAtlas.getTexture("bubbleLarge1");
			//var backgroundImage:Image = new Image(backgroundTexture);
			//
			//this.addChild(backgroundImage);
			
			var quad:Quad = new Quad(720, 20, 0x3A5B37);
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
			return ScreensConstants.SIXTH_SCREEN;
		}
		
	}

}
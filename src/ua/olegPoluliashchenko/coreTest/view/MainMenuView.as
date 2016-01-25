package ua.olegPoluliashchenko.coreTest.view 
{
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import ua.olegPoluliashchenko.coreTest.controller.MainMenuController;
	import ua.olegPoluliashchenko.coreTest.embeddedAssets.EmbeddedAssets;
	import ua.olegPoluliashchenko.coreTest.managers.ScreensConstants;
	import ua.olegPoluliashchenko.coreTest.model.MainMenuModel;
	
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class MainMenuView extends View implements IView 
	{
		
		public function MainMenuView() 
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
			var textureAtlas:TextureAtlas = EmbeddedAssets.textureAtlas;
			var backgroundTexture:Texture = textureAtlas.getTexture("background");
			var backgroundImage:Image = new Image(backgroundTexture);
			
			this.addChild(backgroundImage);
			
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
			return ScreensConstants.FOURTH_SCREEN;
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION
		//
		//--------------------------------------------------------------------------
		
	}

}
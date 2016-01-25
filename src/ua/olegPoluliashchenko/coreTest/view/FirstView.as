package ua.olegPoluliashchenko.coreTest.view 
{
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import ua.olegPoluliashchenko.coreTest.events.ScreenLoadEvent;
	import ua.olegPoluliashchenko.coreTest.managers.ScreensConstants;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class FirstView extends View implements IView 
	{
	
		private var textField:TextField;
		
		public function FirstView() 
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
			
			var quad:Quad = new Quad(720, 30, 0x8D7229);
			this.addChild(quad);
			
			textField = new TextField(720, 30, "Test!");
			textField.hAlign = HAlign.LEFT;
			this.addChild(textField);
			
			super.scrceenIn();
		}
		
		override public function addListeners():void
		{
			this.addEventListener(ScreenLoadEvent.SCREEN_LOAD, firstView_screenLoadHandler);
			super.addListeners();
		}
		
		override public function removeListeners():void
		{
			this.addEventListener(ScreenLoadEvent.SCREEN_LOAD, firstView_screenLoadHandler);
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
			return ScreensConstants.FIFTH_SCREEN;
		}
		
		
		private function firstView_screenLoadHandler(event:ScreenLoadEvent):void 
		{
			textField.text = event.data.msg;
		}
		
	}

}
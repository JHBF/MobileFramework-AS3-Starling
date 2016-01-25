package core.baseClasses 
{
	import core.screens.ScreenVO;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class View extends Sprite implements IView
	{
		public var view:Sprite;
		
		public var model:IModel;
		
		public var controller:IController;
		
		private var _currentModelClass:Class;
		
		private var _currentControllerClass:Class;
		
		public function View() 
		{
			super();
			
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get currentModelClass():* 
		{
			return _currentModelClass(model);
		}
		
		public function set currentModelClass(value:Class):void 
		{
			_currentModelClass = value;
		}
		
		public function get currentControllerClass():* 
		{
			return _currentControllerClass(controller);
		}
		
		public function set currentControllerClass(value:Class):void 
		{
			_currentControllerClass = value;
		}
		
		public function initialize(controller:IController, model:IModel, screenClassesVO:ScreenVO):void
		{
			this.controller = controller;
			this.model = model;
			
			currentModelClass = Class(screenClassesVO.modelName);
			currentControllerClass = Class(screenClassesVO.controllerName);
			
			addListeners();
		}
		
		public function scrceenIn():void
		{
			
		}
		
		public function addListeners():void
		{
			
		}
		
		public function removeListeners():void
		{
			
		}
		
		public function disposeView():void
		{
			removeListeners();
			
			if (view)
			{
				view.dispose();
			}
			
			view = null;
			model = null;
			controller = null;
			_currentModelClass = null;
			_currentControllerClass = null;
		}
		
	}

}
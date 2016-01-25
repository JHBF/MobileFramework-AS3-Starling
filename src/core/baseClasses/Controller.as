package core.baseClasses 
{
	import core.screens.ScreenVO;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class Controller implements IController
	{
		public var model:IModel;
		
		public var view:IView;
		
		private var _currentModelClass:Class;
		
		private var _currentViewClass:Class;
		
		public function Controller()
		{
			
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
		
		public function get currentViewClass():* 
		{
			return _currentViewClass(view);
		}
		
		public function set currentViewClass(value:Class):void 
		{
			_currentViewClass = value;
		}
		
		public function initialize(model:IModel, view:IView, screenClassesVO:ScreenVO):void
		{
			this.model = model;
			this.view = view;
			
			currentModelClass = Class(screenClassesVO.modelName);
			currentViewClass = Class(screenClassesVO.viewName);
			
			this.model.initialize();
			this.view.initialize(this, model, screenClassesVO);
			addListeners();
			controllerIn();
		}
		
		public function controllerIn():void
		{
			model.modelIn()
			view.scrceenIn();
		}
		
		public function destroy():void
		{
			removeListeners();
			view.disposeView();
			model.destroy();
			view = null;
			model = null;
			_currentModelClass = null;
			_currentViewClass = null;
		}
		
		public function addListeners():void
		{
			
		}
		
		public function removeListeners():void
		{
			
		}
		
	}

}
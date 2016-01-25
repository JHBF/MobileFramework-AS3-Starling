package core.screens 
{
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ScreenVO 
	{
		private var _viewName:Class;
		private var _controllerName:Class;
		private var _modelName:Class;
		private var _layer:String;
		
		public function ScreenVO(_viewName:Class, _controllerName:Class, _modelName:Class, _layer:String) 
		{
			this._viewName = _viewName;
			this._controllerName = _controllerName;
			this._modelName = _modelName;
			this._layer = _layer;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get viewName():Class 
		{
			return _viewName;
		}
		
		public function get controllerName():Class 
		{
			return _controllerName;
		}
		
		public function get modelName():Class 
		{
			return _modelName;
		}
		
		public function get layer():String 
		{
			return _layer;
		}
		
	}

}
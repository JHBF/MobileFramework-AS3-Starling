package core.layers 
{
	import core.layers.LayerAlign;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class LayerVO 
	{
		private var _x:Number;
		private var _y:Number;
		private var _depth:int;
		private var _align:String;
		private var _isScaleOnFullStage:Boolean;
		
		public function LayerVO(_x:Number, _y:Number, _depth:int = 0, _align:String = LayerAlign.NONE, _isScaleOnFullStage:Boolean = false) 
		{
			this._x = _x;
			this._y = _y;
			this._depth = _depth;
			this._align = _align;
			this._isScaleOnFullStage = _isScaleOnFullStage;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function get depth():int 
		{
			return _depth;
		}
		
		public function get align():String 
		{
			return _align;
		}
		
		public function get isScaleOnFullStage():Boolean 
		{
			return _isScaleOnFullStage;
		}
		
	}

}
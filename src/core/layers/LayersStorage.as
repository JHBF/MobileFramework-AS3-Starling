package core.layers 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class LayersStorage 
	{
		private var _layersList:Dictionary;// = new Dictionary();
		
		//_layersList[LayersConstants.BACKGROUND_LAYER] = { x:0, y:0, depth:0, align:LayerAlign.NONE, isScaleOnFullStage:true  };
		//_layersList[LayersConstants.TOP_LAYER] = { x:0, y:10, depth:1, align:LayerAlign.TOP, isScaleOnFullStage:false };
		//_layersList[LayersConstants.DOWN_LAYER] = { x:0, y:450, depth:2, align:LayerAlign.BOTTOM, isScaleOnFullStage:false };
		//_layersList[LayersConstants.CENTER_LAYER] = { x:0, y:50, depth:3, align:LayerAlign.CENTER, isScaleOnFullStage:false };
		
		public function LayersStorage(layersList:Dictionary)
		{
			_layersList = layersList;
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION
		//
		//--------------------------------------------------------------------------
		
		public function get layersList():Dictionary 
		{
			return _layersList;
		}
		
		public function getLayer(layersConstants:String):Object 
		{
			return _layersList[layersConstants];
		}
		
	}

}
package ua.olegPoluliashchenko.coreTest.managers 
{
	import core.layers.LayerAlign;
	import core.layers.LayerVO;
	import ua.olegPoluliashchenko.coreTest.managers.LayersConstants;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class Layers 
	{
		private var _layersList:Dictionary;
		
		public function Layers()
		{
			_layersList = new Dictionary();
			
			_layersList[LayersConstants.BACKGROUND_LAYER] = new LayerVO(0, 0, 0, LayerAlign.NONE, true);
			_layersList[LayersConstants.TOP_LAYER] = new LayerVO(0, 10, 1, LayerAlign.TOP, false);
			_layersList[LayersConstants.DOWN_LAYER] = new LayerVO(0, 450, 2, LayerAlign.BOTTOM, false);
			_layersList[LayersConstants.CENTER_LAYER] = new LayerVO(0, 50, 3, LayerAlign.CENTER, false);
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
		
	}

}
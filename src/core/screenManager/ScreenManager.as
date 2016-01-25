package core.screenManager 
{
	import core.baseClasses.IController;
	import core.baseClasses.IModel;
	import core.baseClasses.IView;
	import core.baseClasses.View;
	import core.events.ClearLayerEvent;
	import core.events.NotificationEvent;
	import core.events.ScreenChangeEvent;
	import core.layers.LayerAlign;
	import core.layers.LayersStorage;
	import core.layers.LayerVO;
	import core.screens.ScreensStorage;
	import core.screens.ScreenVO;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public class ScreenManager extends Sprite 
	{
		private var model:IModel;
		private var controller:IController;
		private var view:IView;
		
		private var layers:Dictionary;
		
		private var startedScreensList:Vector.<String>;
		
		private var scaleForGameObject:Number = 1;
		private var scaleForBackground:Number = 1;
		
		private var graphicsWidth:Number = 720;
		private var graphicsHeight:Number = 480;
		
		private var screensStorage:ScreensStorage;
		private var layersStorage:LayersStorage;
		
		private var screenWidth:Number;
		private var screenHeight:Number;
		
		public function ScreenManager(startedScreensList:Vector.<String>, screensStorage:ScreensStorage, layersStorage:LayersStorage, graphicsWidth:Number = 720, graphicsHeight:Number = 480) 
		{
			super();
			this.startedScreensList = startedScreensList;
			this.screensStorage = screensStorage;
			this.layersStorage = layersStorage;
			this.graphicsWidth = graphicsWidth;
			this.graphicsHeight = graphicsHeight;
			this.addEventListener(Event.ADDED_TO_STAGE, screenManger_addedToStageHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION
		//
		//--------------------------------------------------------------------------
		
		private function screenManger_addedToStageHandler(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, screenManger_addedToStageHandler);
			
			screenWidth = Starling.current.nativeStage.stageWidth;
			screenHeight = Starling.current.nativeStage.stageHeight;
			
			scaleContent();
			
			createLayers();
			
			for (var i:int = 0; i < startedScreensList.length; i++)
			{
				createScreen(startedScreensList[i]);
				centerLayerMoveTo(startedScreensList[i]);
			}
			startedScreensList = null;
			
			addListeners();
		}
		
		private function createLayers():void 
		{
			layers = new Dictionary();
			var layersList:Dictionary = layersStorage.layersList;
			
			var layerName:String;
			var data:Object;
			var spriteLayer:Sprite;
			var sortingLayersList:Vector.<Object> = new Vector.<Object>();
			var layerPoint:Point;
			
			for (data in layersList)
			{
				sortingLayersList.push( { layerName:data, layerDepth:layersList[data].depth } );
				sortingLayersList.sort(sortingLayers);
			}
			
			for (var i:int = 0; i < sortingLayersList.length; i++)
			{
				layerName = sortingLayersList[i].layerName;
				
				spriteLayer = new Sprite();
				
				layerPoint = !layersList[layerName].isScaleOnFullStage ? layerPosition(layersList[layerName]) : new Point(layersList[layerName].x, layersList[layerName].y);
				
				if (layersList[layerName].isScaleOnFullStage)
				{
					spriteLayer.scaleX *= scaleForBackground;
					spriteLayer.scaleY *= scaleForBackground;
				}
				else
				{
					spriteLayer.scaleX *= scaleForGameObject;
					spriteLayer.scaleY *= scaleForGameObject;
				}
				
				spriteLayer.x = layerPoint.x;
				spriteLayer.y = layerPoint.y;
				
				addChild(spriteLayer);
				layers[layerName] = spriteLayer;
			}
		}
		
		private function layerPosition(layerObject:LayerVO):Point 
		{
			var point:Point;
			
			var w:Number;
			var h:Number;
			
			if (layerObject.align == LayerAlign.NONE)
			{
				point = new Point(layerObject.x * scaleForGameObject, layerObject.y * scaleForGameObject);
			}
			else if (layerObject.align == LayerAlign.BOTTOM)
			{
				w = graphicsWidth - layerObject.x;
				h = graphicsHeight - layerObject.y;
				
				w *= scaleForGameObject;
				h *= scaleForGameObject;
				
				point = new Point((screenWidth - w) / 2, screenHeight - h);
			}
			else if (layerObject.align == LayerAlign.CENTER)
			{
				point = new Point(layerObject.x * scaleForGameObject, layerObject.y * scaleForGameObject);
			}
			else if (layerObject.align == LayerAlign.TOP)
			{
				w = graphicsWidth - layerObject.x;
				h = layerObject.y;
				
				w *= scaleForGameObject;
				h *= scaleForGameObject;
				
				point = new Point((screenWidth - w) / 2, h);
			}
			else 
			{
				point = new Point(0, 0);
			}
			
			return point;
		}
		
		private function sortingLayers(a:Object, b:Object):Number
		{
			if (a.layerDepth > b.layerDepth)
			{
				return 1;
			}
			else if (a.layerDepth < b.layerDepth)
			{
				return -1;
			}
			
			return 0;
		}
		
		private function addListeners():void 
		{
			Sprite(view).addEventListener(ScreenChangeEvent.SCREEN_CHANGE, screenManger_screenChangeHandler);
			Sprite(view).addEventListener(NotificationEvent.NOTICE_LAYER, screenManger_noticeLayerHandler);
			Sprite(view).addEventListener(ClearLayerEvent.CLEAR_LAYER, screenManger_clearLayerHandler);
			Sprite(view).addEventListener(ClearLayerEvent.SET_VISIBLE_LAYER, screenManger_setVisibleLayerHandler);
		}
		
		private function removeListeners(currentView:IView = null):void 
		{
			var localView:IView;
			
			if (currentView != null)
			{
				localView = currentView;
			}
			else 
			{
				localView = view;
			}
			
			Sprite(localView).removeEventListener(ScreenChangeEvent.SCREEN_CHANGE, screenManger_screenChangeHandler);
			Sprite(localView).removeEventListener(NotificationEvent.NOTICE_LAYER, screenManger_noticeLayerHandler);
			Sprite(localView).removeEventListener(ClearLayerEvent.CLEAR_LAYER, screenManger_clearLayerHandler);
			Sprite(localView).removeEventListener(ClearLayerEvent.SET_VISIBLE_LAYER, screenManger_setVisibleLayerHandler);
		}
		
		private function screenManger_screenChangeHandler(event:ScreenChangeEvent):void 
		{
			createScreen(event.screenConstant);
			centerLayerMoveTo(event.screenConstant);
		}
		
		private function createScreen(screensConstants:String):void
		{
			var screenClassesVO:ScreenVO = screensStorage.getScreensClasses(screensConstants);
			
			if (!screenClassesVO)
			{
				return;
			}
			
			var layer:Sprite = layers[screenClassesVO.layer];
			
			while (layer.numChildren > 0)
			{
				View(layer.getChildAt(0)).controller.destroy();
				view = View(layer.getChildAt(0));
				removeListeners();
				layer.removeChildAt(0);
			}
			
			var newClass:Class;
			
			newClass = Class(screenClassesVO.modelName);
			model = new newClass();
			
			newClass = Class(screenClassesVO.viewName);
			view = new newClass();
			addListeners();
			
			newClass = Class(screenClassesVO.controllerName);
			controller = new newClass();
			
			layer.addChild(Sprite(view));
			controller.initialize(model, view, screenClassesVO);
		}
		
		private function screenManger_noticeLayerHandler(event:NotificationEvent):void 
		{
			var layerName:String;
			var layer:Sprite;
			var screen:Sprite;
			for (layerName in layers)
			{
				screen = Sprite(layers[layerName]);
				screen = screen.getChildAt(0) as Sprite;
				screen.dispatchEvent(event.sendEvent);
			}
		}
		
		private function screenManger_clearLayerHandler(event:ClearLayerEvent):void 
		{
			var layer:Sprite = layers[event.data.layer];
			var currentView:View;
			
			while (layer.numChildren > 0)
			{
				View(layer.getChildAt(0)).controller.destroy();
				currentView = View(layer.getChildAt(0));
				removeListeners(currentView);
				layer.removeChildAt(0);
			}
		}
		
		private function screenManger_setVisibleLayerHandler(event:ClearLayerEvent):void 
		{
			var layer:Sprite = layers[event.data.layer];
			
			layer.visible = !layer.visible;
		}
		
		private function centerLayerMoveTo(screensConstants:String):void
		{
			var screenClassesVO:ScreenVO = screensStorage.getScreensClasses(screensConstants);
			
			if (!screenClassesVO)
			{
				return;
			}
			
			var layer:Sprite = layers[screenClassesVO.layer];
			
			var layersList:Dictionary = layersStorage.layersList;
			
			if (layersList[screenClassesVO.layer].align == LayerAlign.CENTER && !layersList[screenClassesVO.layer].isScaleOnFullStage)
			{
				var w:Number;
				var h:Number;
				
				w = layersList[screenClassesVO.layer].x;
				h = layersList[screenClassesVO.layer].y;
			
				w *= scaleForGameObject;
				h *= scaleForGameObject;
			
				var wBottom:Number = (graphicsWidth * scaleForGameObject) - (layersList[screenClassesVO.layer].x * scaleForGameObject) - layer.width;// + layerWidth
				var hBottom:Number = (graphicsHeight * scaleForGameObject) - (layersList[screenClassesVO.layer].y * scaleForGameObject) - layer.height;// + layerHeight
				
				layer.x = (((screenWidth - (w + wBottom)) - layer.width) / 2) + w;
				layer.y = (((screenHeight - (h + hBottom)) - layer.height) / 2) + h;
			}
		}
		
		private function scaleContent():void 
		{
			var differenceWidth:Number;
			var differenceHeignt:Number;
			
			var differenceWidthPercent:Number;
			var differenceHeigntPercent:Number;
			
			var stageWidth:Number = screenWidth;
			var stageHeight:Number = screenHeight;
			
			if (stageWidth < graphicsWidth && stageHeight < graphicsHeight)
			{
				differenceWidth = graphicsWidth - stageWidth;
				differenceHeignt = graphicsHeight - stageHeight;
				
				differenceWidthPercent = differenceWidth / graphicsWidth;
				differenceHeigntPercent = differenceHeignt / graphicsHeight;
				
				if (differenceWidthPercent > differenceHeigntPercent)
				{
					scaleForGameObject -= differenceWidthPercent;
					scaleForBackground -= differenceHeigntPercent;
				}
				else
				{
					scaleForGameObject -= differenceHeigntPercent;
					scaleForBackground -= differenceWidthPercent;
				}
			}
			else if(stageWidth >= graphicsWidth && stageHeight >= graphicsHeight)
			{
				differenceWidth = stageWidth - graphicsWidth;
				differenceHeignt = stageHeight - graphicsHeight;
				
				differenceWidthPercent = differenceWidth / graphicsWidth;
				differenceHeigntPercent = differenceHeignt / graphicsHeight;
				
				if (differenceWidthPercent < differenceHeigntPercent)
				{
					scaleForGameObject += differenceWidthPercent;
					scaleForBackground += differenceHeigntPercent;
				}
				else
				{
					scaleForGameObject += differenceHeigntPercent;
					scaleForBackground += differenceWidthPercent;
				}
			}
			else if (stageWidth < graphicsWidth && stageHeight > graphicsHeight)
			{
				differenceWidth = graphicsWidth - stageWidth;
				differenceHeignt = stageHeight - graphicsHeight;
				
				differenceWidthPercent = differenceWidth / graphicsWidth;
				differenceHeigntPercent = differenceHeignt / graphicsHeight;
				
				scaleForGameObject -= differenceWidthPercent;
				scaleForBackground += differenceHeigntPercent;
			}
			else if (stageWidth > graphicsWidth && stageHeight < graphicsHeight) 
			{
				differenceWidth = stageWidth - graphicsWidth;
				differenceHeignt = graphicsHeight - stageHeight;
				
				differenceWidthPercent = differenceWidth / graphicsWidth;
				differenceHeigntPercent = differenceHeignt / graphicsHeight;
				
				scaleForGameObject -= differenceHeigntPercent;
				scaleForBackground += differenceWidthPercent;
			}
			else if (stageWidth < graphicsWidth)
			{
				differenceWidth = graphicsWidth - stageWidth;
				
				differenceWidthPercent = differenceWidth / graphicsWidth;
				
				scaleForGameObject -= differenceWidthPercent;
				scaleForBackground += differenceWidthPercent;
			}
			else if (stageHeight < graphicsHeight)
			{
				differenceHeignt = graphicsHeight - stageHeight;
				
				differenceHeigntPercent = differenceHeignt / graphicsHeight;
				
				scaleForGameObject -= differenceHeigntPercent;
				scaleForBackground += differenceHeigntPercent;
			}
		}
	}

}
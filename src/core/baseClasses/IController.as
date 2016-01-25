package core.baseClasses 
{
	import core.screens.ScreenVO;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public interface IController 
	{
		function initialize(model:IModel, view:IView, screenClassesVO:ScreenVO):void;
		function controllerIn():void;
		function destroy():void;
		function addListeners():void;
		function removeListeners():void;
	}
	
}
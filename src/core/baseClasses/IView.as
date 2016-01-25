package core.baseClasses 
{
	import core.screens.ScreenVO;
	
	/**
	 * ...
	 * @author Oleg Poluliashchenko
	 */
	public interface IView 
	{
		function initialize(controller:IController, model:IModel, screenClassesVO:ScreenVO):void;
		function scrceenIn():void;
		function addListeners():void;
		function removeListeners():void;
		function disposeView():void;
	}
	
}
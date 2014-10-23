package src 
{ 
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Game extends Sprite
	{
		private var main : Main;
		private var startMenu : StartMenu;
		
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init():void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			startMenu = new StartMenu();
			addChild(startMenu);
			
			startMenu.addEventListener(StartMenu.START, StartGame);
			
		}
		public function StartGame(e:Event):void 
		{
			removeChild(startMenu);
			main = new Main;
			addChild(main);
		}
	}
}
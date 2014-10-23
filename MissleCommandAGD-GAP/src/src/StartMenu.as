package src 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class StartMenu extends Sprite
	{
		private var menuBody : MenuBody;
		private var menuStartButton : MenuStartButton;
		
		public const START : String = "gameStart";
		
		public function StartMenu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			menuBody = new MenuBody();
			menuBody.scaleX = 1.45;
			menuBody.scaleY = 1.5;
			
			menuStartButton = new MenuStartButton();
			menuStartButton.x =  stage.stageWidth / 2;
			menuStartButton.Y =  -400;
			
			menuStartButton.addEventListener(MouseEvent.CLICK, clicked);
			
			addChild(menuBody);
			addChild(menuStartButton);
			
			
		}
		private function clicked(e:MouseEvent):void 
		{
			if (e.target == menuStartButton)
			{
				dispatchEvent(new Event(START));
			}
		}
		
	}

}
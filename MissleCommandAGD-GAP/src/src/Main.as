package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var myTimer:Timer = new Timer(1,1000);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			function timerListener (e:TimerEvent):void
			{
				newEnemyMissle();
			}
			myTimer.start();
		}
		private function newEnemyMissle():void
		{
			var newMissle: Missle1 = new Missle1();
			addChild(newMissle);
			newMissle.x = Math.random() * stage.stageWidth;
		}
	}
	
}
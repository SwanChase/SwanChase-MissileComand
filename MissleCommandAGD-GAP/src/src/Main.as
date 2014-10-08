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
		private var tower : Tower;
		
		private var ground : Ground;
		
		private var playerMissiles : Array;
		private var enemyMissiles : Array;
		
		private var missileFactory: MissileFactory;
		
		public function Main():void 
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var myTimer:Timer = new Timer(1000,5);
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			function timerListener (e:TimerEvent):void
			{
				newEnemyMissle();
			}
			myTimer.start();
			
			playerMissiles = [];
			enemyMissiles = [];
			
			var ground :Ground = new Ground();
			missileFactory = new MissileFactory();
			
			ground.x = stage.stageWidth / 2;
			ground.y = 600;
			addChild(ground);
			
			tower = new Tower();
			tower.scaleX = 2;
			tower.scaleY = 2;
			tower.x = 40;
			tower.y = 500;
			
			addChild(tower);
			tower.addEventListener(Tower.SHOOT, fire);
		}
		
		private function update(e:Event):void 
		{
			var l : int	= playerMissiles.length;
			var j : int	= enemyMissiles.length;
			
			//for (var i : int = 0 ; i < l ; i++ )
			for (var i : int = l - 1; i >= 0 ; i--)
			{
				playerMissiles[i].update();
			}
			
			for (var i : int = j - 1; i >= 0 ; i--)
			{
				enemyMissiles[i].update();
			}
		}
		
		private function fire(e:Event):void 
		{
			var newMissile = missileFactory.makeMissile(MissileFactory.BASIC_MISSILE, tower.turretRotation,tower.x,tower.y, this);
			
			playerMissiles.push(newMissile);
		}
		
		private function newEnemyMissle():void
		{
			var newMissle: EnemyMissile = new EnemyMissile();
			addChild(newMissle);
			newMissle.x = Math.random() * stage.stageWidth;
			enemyMissiles.push(newMissle);
		}
	}
}
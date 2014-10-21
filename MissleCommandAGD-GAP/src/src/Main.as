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
		private var groundObjects : Array;
		private var towers : Array;
		
		private var missileFactory: MissileFactory;
		private var groundFactory: GroundFactory;
		private var towerFactory: TowerFactory;
		
		public function Main():void 
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function timerListener2 (e:TimerEvent):void
		{
			var newObject:GroundPerson = groundFactory.makeObject(GroundFactory.BASIC_PERSON, 0, 533, this);
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var makeMissileTimer:Timer = new Timer(1000, 5);
			var makeGroundTimer:Timer = new Timer(3000, 30);
			
			makeMissileTimer.addEventListener(TimerEvent.TIMER, timerListener);
			makeGroundTimer.addEventListener(TimerEvent.TIMER, timerListener2);
			
			function timerListener (e:TimerEvent):void
			{
				newEnemyMissle();
			}
			makeMissileTimer.start();
			makeGroundTimer.start();
			
			towers = [];
			groundObjects = [];
			playerMissiles = [];
			enemyMissiles = [];
			
			missileFactory = new MissileFactory();
			groundFactory = new GroundFactory();
			towerFactory = new TowerFactory();
			
			ground = new Ground();
			ground.scaleX = 2;
			ground.x = 0;
			ground.y = 550;
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
			
			for (var k : int = j - 1; k >= 0 ; k--)
			{
				enemyMissiles[k].update();
			}
		}
		
		private function fire(e:Event):void 
		{
			var newMissile = missileFactory.makeMissile(MissileFactory.BASIC_MISSILE, tower.turretRotation,tower.x,tower.y, this, mouseY);
			trace(mouseY);
			playerMissiles.push(newMissile);
		}
		/*private function spawn(e:Event):void 
		{
			var newGroundObject = newGroundObject.makeObject(GroundFactory.BASIC_PERSON,tower.x,tower.y, this);
			
			groundObjects.push(newGroundObject);
		}*/
		
		private function newEnemyMissle():void
		{
			var newMissle: EnemyMissile = new EnemyMissile();
			addChild(newMissle);
			newMissle.x = Math.random() * stage.stageWidth;
			enemyMissiles.push(newMissle);
		}
	}
}
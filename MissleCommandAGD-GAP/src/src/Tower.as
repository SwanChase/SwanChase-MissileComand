package src 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Tower extends Sprite
	{
		private var tower : Tower1;// = new Tower1;
		private var barrel : Barrel;// = new Barrel;
		
		public function Tower():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null)
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Tower1 = new Tower1;
			Barrel = new Barrel;
			
			barrel.x = 20;
			tower.x = 20;
			
			barrel.y = 100;
			tower.y = 100;
			
			addChild(barrel);
			addChild(tower);
			
			
		}
	}

}
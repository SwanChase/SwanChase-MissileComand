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
		private var tower : Tower1 = new Tower1;
		
		public function Tower() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null)
		{
			tower.x = 20;
			tower.y = 100;
			addChild(tower);
			
			
		}
	}

}
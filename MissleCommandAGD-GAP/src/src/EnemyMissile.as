package src 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class EnemyMissile extends Sprite
	{
		
		private var asset:Missle1;
		
		public function EnemyMissile() 
		{
			asset = new Missle1();
			addChild (asset);
			//this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update():void 
		{
			y = y + 3;
		}
		
	}

}
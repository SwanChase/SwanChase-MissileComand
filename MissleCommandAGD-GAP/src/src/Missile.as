package src 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Missile extends Sprite
	{
		
		private var asset:missile;
		
		public function Missile() 
		{
			asset = new missile();
			addChild (asset);
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			y = y + 5;
		}
		
	}

}
package src 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Tower extends Sprite
	{
		public static const SHOOT : String	=	"shoot";
		
		private var tower : Tower1;
		private var barrel : Barrel;
		
		public function Tower():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null)
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(MouseEvent.CLICK, fire);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, aimTurret);
			
			tower = new Tower1();
			barrel = new Barrel();
			
			barrel.x = 00;
			tower.x = 00;
			
			barrel.y = 00;
			tower.y = 00;
			
			addChild(barrel);
			addChild(tower);
			
			
		}
		
		private function aimTurret(e:MouseEvent):void 
		{
			var diffX : Number = e.localX - this.x;
			var diffY : Number = e.localY - this.y;
			
			var rotationInRadians : Number = Math.atan2(diffY, diffX);
			
			barrel.rotation	= rotationInRadians * (180 / Math.PI);
			
			//var dir = Math.atan2(this.y - e.localX, this. x - e.localY);
			//this.rotation = dir * 180/Math.PI + 180;
			
			
		}
		
		private function fire(e:MouseEvent):void 
		{
			//barrel.play();
			dispatchEvent(new Event(SHOOT));
		}
		
		public function get turretRotation() : Number
		{
			return barrel.rotation;
		}
		
		
	}
}
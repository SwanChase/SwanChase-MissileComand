package src 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class PlayerMissile extends Sprite
	{
		
		protected var asset2 : Missle2;
		
		protected var stepX	: Number;
		protected var stepY	: Number;
		
		protected var speed : Number;
		protected var destination:Number;
		
		public function PlayerMissile() 
		{
			super();
			
			speed = 15;
			
			asset2 = new Missle2();
			
			addChild(asset2);
		}
		
		public function setDirection(angle : Number, des : Number ) : void
		{
			var radian	:	Number	=	angle / (180 / Math.PI);
			stepX	=	Math.cos( radian ) * speed;
			stepY	=	Math.sin( radian ) * speed;
			rotation = angle +90;
			destination = des;
		}	
		
		public function update() : void
		{
			this.x	+=	stepX;
			this.y	+=	stepY;
			if (y <= destination)
			{
				
			}
			
		}
		
	}

}
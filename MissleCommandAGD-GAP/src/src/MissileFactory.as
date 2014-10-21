package src 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class MissileFactory 
	{
		public static const BASIC_MISSILE : String = "basicMissile";
		public static const CANNON_BALL : String = "cannonBall";
		
		public function makeMissile( type : String, rotation:Number,x:Number,y:Number,targetContainer:Sprite, mPos:Number) : PlayerMissile
		{
			var newMissile : PlayerMissile;
			
			switch (type )
			{
				case BASIC_MISSILE :
					newMissile = new PlayerMissile();
				break;
				
				case CANNON_BALL:
					newMissile = new PlayerCannonBall();
				break;
					
			}
			
			
			newMissile.setDirection(rotation, mPos);
			
			newMissile.x = x;
			newMissile.y = y;
			//newMissile....
			
			
			targetContainer.addChildAt(newMissile, 0);
			
			return newMissile;
		}
		
	}

}
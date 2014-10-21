package src 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class TowerFactory 
	{
		public static const BASIC_TOWER : String = "basicTower";
		public static const FAST_TOWER : String = "fastTower";
		
		public function makeTower( type : String,x:Number,y:Number,targetContainer:Sprite) : Tower
		{
			var newTower : Tower;
			
			switch (type )
			{
				case BASIC_TOWER :
					newTower = new Tower();
				break;
				
				case FAST_TOWER :
					newTower = new FastTower();
				break;
					
			}
			
			
			newTower.x = x;
			newTower.y = y;
			
			
			targetContainer.addChildAt(newTower, 0);
			
			return newTower;
		}
		
	}

}
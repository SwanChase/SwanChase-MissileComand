package src 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class GroundFactory 
	{
		public static const BASIC_PERSON : String = "basicPerson";
		public static const BASIC_CAR : String = "basicCar";
		
		public function makeObject( type : String,x:Number,y:Number,targetContainer:Sprite) : GroundPerson
		{
			var newGroundObject : GroundPerson;
			
			
			switch (type )
			{
				case BASIC_PERSON :
					newGroundObject = new GroundPerson();
				break;
				
				case BASIC_CAR :
					newGroundObject = new GroundCar();
				break;
					
			}
			
			
			//newGroundObject.setDirection(rotation);
			
			newGroundObject.x = x;
			newGroundObject.y = y;
			
			
			targetContainer.addChildAt(newGroundObject, 0);
			
			return newGroundObject;
		}
		
	}

}
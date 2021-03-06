package src 
{	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class GroundPerson extends Sprite
	{
		private var person : Person;
		
		private var _direction : int;
		private var _speed : int = 1;
		private var _stage : Stage;
		
		public function GroundPerson() 
		{
			
			person = new Person();
			person.scaleX = 0.5;
			person.scaleY = 0.5;
			
			addChild(person);
			
			_stage = stage;
			
			_direction = 1;
			//addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		
		
		private function move(e:Event):void 
		{
			if (x >= 800 && _direction == 1 || x <= 0 && _direction == -1)
			{
				_direction *= -1;
			}
			
			// beweeg in de richting waar je heen moet lopen
			x += _direction * _speed;
			
			// zet de enemy weer op de grond
		}
		public function setDirection(rotation:Number):void
		{
			
		}
	}

}
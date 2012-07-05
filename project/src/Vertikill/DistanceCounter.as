package Vertikill 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class DistanceCounter extends Sprite
	{
		private var _distance:int = 0;
		
		private var _distanceText:TextField;
		
		public function DistanceCounter() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this._onAddedToStage);
		}
		
		private function _onAddedToStage(_event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			this._distanceText = new TextField(100, 20, this._distance + 'M', 'Verdana', 12, 0xFFFFFF, true);			
			this._distanceText.x = 10;
			this._distanceText.y = 100;
			this.addChild(this._distanceText);
		}		
		
		public function get distance():int 
		{
			return _distance;
		}
		
		public function set distance(value:int):void 
		{
			_distance = value;
		}
		
	}

}
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
		private var _distance:Number = 0;
		
		private var _distanceText:TextField;
		
		public function DistanceCounter() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this._onAddedToStage);
		}
		
		// PRIVATE
		
		private function _onAddedToStage(_event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			this._distanceText = new TextField(100, 20, this._distance + 'M', 'Verdana', 12, 0xFFFFFF, true);			
			this._distanceText.x = 10;
			this._distanceText.y = 100;
			this.addChild(this._distanceText);
		}		
		
		private function _update():void
		{
			this._distanceText.text = int(this._distance) + 'KM';
		}
		
		// PUBLIC
		
		public function get distance():Number 
		{
			return _distance;
		}
		
		public function set distance(value:Number):void 
		{
			this._distance = value;
			this._update();			
		}
		
	}

}
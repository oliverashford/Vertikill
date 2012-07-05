package Vertikill 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class GoldCounter extends Sprite
	{
		private var _gold:int = 0;
		
		private var _goldText:TextField;
		
		public function GoldCounter() 
		{		
			this.addEventListener(Event.ADDED_TO_STAGE, this._onAddedToStage);
		}
		
		private function _onAddedToStage(_event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			this._goldText = new TextField(100, 20, 'GOLD: ' + this._gold, 'Verdana', 12, 0xFFFFFF, true);		
			this._goldText.x = 10;
			this._goldText.y = 120;	
			this.addChild(this._goldText);		
		}
		
		public function get gold():int 
		{
			return _gold;
		}
		
		public function set gold(value:int):void 
		{
			_gold = value;
		}
		
	}

}
package Vertikill 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	 public class Player extends Sprite 
	{
		private var _col:uint = 0;
		private var _dX:uint = 10;		// player horizontal speed
					
		public function Player(_startingCol:uint) 
		{
			this.y = 850;
			
			// set starting col
			this._col = _startingCol;
			
			// create a Image object with our one texture
			var playerImage:Image = new Image(Assets.getTexture('Plane'));

			// show it
			this.addChild(playerImage);
		}		
		
		public function get col():uint 
		{
			return _col;
		}
		
		public function set col(value:uint):void 
		{
			_col = value;
		}
		
		public function get dX():uint 
		{
			return _dX;
		}
		
		public function set dX(value:uint):void 
		{
			_dX = value;
		}
	}
}
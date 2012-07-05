package Vertikill 
{
	import starling.core.Starling;
	import starling.display.MovieClip;
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
		
		private var _playerGfx:MovieClip;
					
		public function Player(_startingCol:uint) 
		{
			this.y = 850;
			
			// set starting col
			this._col = _startingCol;
			
			// create the movie clip from the sprites in the sprite atlas which came from fiels with the name 'martian_'
			this._playerGfx = new MovieClip(Assets.getAtlas().getTextures('plane_'), 1);
						
			// start the jugler to animate
			Starling.juggler.add(this._playerGfx);
			
			// show it
			this.addChild(this._playerGfx);
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
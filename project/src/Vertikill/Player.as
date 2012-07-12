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
		private var _dX:uint = 10;		// player horizontal speed
		
		private var _playerGfx:MovieClip;
		
		private var _bulletCounter:uint = 0;
		
		private var _currentWeaponDY:int = 10;
		
		public function Player(_startingCol:uint) 
		{
			this.y = 850;
						
			// create the movie clip from the sprites in the sprite atlas which came from fiels with the name 'martian_'
			this._playerGfx = new MovieClip(Assets.getAtlas().getTextures('plane_'), 1);
						
			// start the jugler to animate
			Starling.juggler.add(this._playerGfx);
			
			// show it
			this.addChild(this._playerGfx);
		}		
		
		// PRIVATE
		
		// PUBLIC
		
		public function update():void
		{
			var self:Player = this;
			
			// check bullet counter and if its time fire a bullet
			this._bulletCounter++;
			
			if(this._bulletCounter == Settings.BULLET_COUNTER_MAX)
			{
				this.dispatchEvent(new DataEvent('FIRE_BULLET', {
					x:self.x + (self.width / 2), 
					y:self.y, 
					dX:0, 
					dY:self._currentWeaponDY, 
					damage:10}));
				
				this._bulletCounter	= 0;
			}
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
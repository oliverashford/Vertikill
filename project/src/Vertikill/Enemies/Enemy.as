package Vertikill.Enemies 
{
	import com.greensock.TweenMax;
	
	import Vertikill.Assets;	
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Enemy extends Sprite
	{
		private var _enemyGfx:MovieClip;
		
		private var _dY:int = 2;
		
		public function Enemy() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this._onAddedToStage);
		}
		
		// PRIVATE
		
		private function _onAddedToStage(_event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			this._createEnemyGfx();
			
			TweenMax.to(this, 3, {x:640, repeat:-1, yoyo:true});
		}
		
		private function _createEnemyGfx():void 
		{
			// create the movie clip from the sprites in the sprite atlas which came from fiels with the name 'martian_'
			this._enemyGfx = new MovieClip(Assets.getAtlas().getTextures('martian_'), 16);
						
			// start the jugler to animate
			Starling.juggler.add(this._enemyGfx);
			
			// add to stage
			this.addChild(this._enemyGfx);
		}
		
		// PUBLIC
		
		public function get dY():int 
		{
			return _dY;
		}
		
		public function set dY(value:int):void 
		{
			_dY = value;
		}
		
	}

}
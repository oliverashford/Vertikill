package Vertikill.Collectibles 
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
	
	public class Collectible extends Sprite
	{
		private var _collectibleGfx:MovieClip;
		
		private var _dY:int = 10;
		
		public function Collectible() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this._onAddedToStage);
		}
		
		// PRIVATE
		
		private function _onAddedToStage(_event:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			this._createCollectibleGfx();
		}
		
		private function _createCollectibleGfx():void 
		{
			// create the movie clip from the sprites in the sprite atlas which came from fiels with the name 'martian_'
			this._collectibleGfx = new MovieClip(Assets.getAtlas().getTextures('coin_'), 16);
						
			// start the jugler to animate
			Starling.juggler.add(this._collectibleGfx);
			
			// add to stage
			this.addChild(this._collectibleGfx);
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
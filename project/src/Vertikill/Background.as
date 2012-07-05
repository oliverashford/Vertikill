package Vertikill 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	 public class Background extends Sprite 
	{
		private var _speed:Number = 0;		// set from Settings.BACKGROUND_START_SPEED
		
		private var _screenHeight:uint;
				
		private var _panels:Vector.<Image> = new Vector.<Image>;
			
		public function Background(_screenHeight:uint) 
		{
			this._speed = Settings.BACKGROUND_START_SPEED;
			
			this._screenHeight = _screenHeight;
						
			this.addNew();
			this.addNew();
			this.addNew();
		}
		
		public function move():void
		{
			// move each of the images
			for (var i:uint = 0; i < this._panels.length; i++ ) {
				
				this._panels[i].y += this._speed;
			
				// check each panel if it is off the screen
				
				if (this._panels[i].y > this._screenHeight)
				{
					// this background image is fully off screen
					this.removeChild(this._panels[i]);
					
					this._panels.splice(i, 1);
					
					this.addNew();
				}
			}
		}
		
		private function addNew():void
		{	
			var rand:uint = Math.floor(Math.random() * (3)) + 1;
			
			// create a Image object with our one texture
			var grassImage:Image = new Image(Assets.getAtlas().getTexture('grass_' + rand));
						
			grassImage.y = -this._screenHeight * this._panels.length;
			
			// add to collection of backgrounds
			this._panels.push(grassImage);
			
			// show it
			this.addChild(grassImage);
			
			grassImage = null;
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(value:Number):void 
		{
			_speed = value;
		}
	}
}
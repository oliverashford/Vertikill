package Vertikill.Bullets 
{
	import flash.display.Bitmap;
	
	import Vertikill.Assets;
	import Vertikill.Settings;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	 public class Bullet extends Sprite 
	{
		private var _dY:Number = 0;
		
		public function Bullet(_x:int, _y:int) 
		{			
			this._dY = Settings.BULLET_SPEED;
		
			this.x = _x - this.width;
			this.y = _y;
			
			// create a Image object with our one texture
			var bulletImage:Image = new Image(Assets.getAtlas().getTexture('bullet_1'));

			// show it
			this.addChild(bulletImage);
		}	
		
		// PUBLIC
		
		public function get speed():Number 
		{
			return _dY;
		}
		
		public function set speed(value:Number):void 
		{
			_dY = value;
		}	
	}
}
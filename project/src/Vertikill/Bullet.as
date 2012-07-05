package Vertikill 
{
	import flash.display.Bitmap;
	
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
		private var _speed:Number = 0;
		
		public function Bullet(_x:int, _y:int) 
		{
			
			this._speed = Settings.BULLET_SPEED;
		
			this.x = _x;
			this.y = _y;
			
			// create a Image object with our one texture
			var bulletImage:Image = new Image(Assets.getAtlas().getTexture('bullet_1'));

			// show it
			this.addChild(bulletImage);
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
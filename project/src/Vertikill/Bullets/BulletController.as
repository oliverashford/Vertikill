package Vertikill.Bullets 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class BulletController extends Sprite
	{				
		private var _bullets:Vector.<Bullet> = new Vector.<Bullet>;
		
		public function BulletController() 
		{
			
		}
		
		// PRIVATE
		
		private function _move():void
		{
			// move bullets
			for (var i:uint = 0; i < this._bullets.length; i++) {
				this._bullets[i].y -= this._bullets[i].speed;
				
				// check bullets position
				if (this._bullets[i].y < 0) 
				{
					this.removeChild(this._bullets[i]);
					this._bullets.splice(i, 1);
				}
			}	
		}
		
		// PUBLIC
		
		public function addBullet(_spawnX:int, _spawnY:int, _dY:int, _dX:int):void
		{			
			var tempBullet:Bullet = new Bullet(_spawnX, _spawnY);
			
			this._bullets.push(tempBullet);
			
			// add bullet gfx
			this.addChild(tempBullet);
		}
		
		public function update():void
		{			
			// move all the bullets
			this._move();
		}
		
		public function get bullets():Vector.<Bullet> 
		{
			return _bullets;
		}
		
		public function set bullets(value:Vector.<Bullet>):void 
		{
			_bullets = value;
		}
	}

}
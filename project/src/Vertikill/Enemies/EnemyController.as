package Vertikill.Enemies
{
	import flash.geom.Rectangle;
	
	import Vertikill.Explosions.ExplosionController;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.textures.Texture;	
	import starling.extensions.*;
	
	//import starling.extensions.
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class EnemyController extends Sprite
	{		
		private var _enemies:Vector.<Enemy> = new Vector.<Enemy>;
				
		public function EnemyController()
		{			
			this.addEnemy();
		}
		
		// PRIVATE
		
		private function removeEnemy(_index:uint):void 
		{
			this.removeChild(this._enemies[_index]);
			this._enemies.splice(_index, 1);
		}
		
		// PUBLIC
		
		public function addEnemy():void
		{
			var tempEnemy:Enemy = new Enemy();
			
			this.addChild(tempEnemy);
			
			_enemies.push(tempEnemy);
		}
		
		public function moveEnemies():void
		{
			// move enemies
			for (var i:uint = 0; i < this._enemies.length; i++)
			{
				this._enemies[i].y += this._enemies[i].dY;
				
				// check enemies position
				if (this._enemies[i].y > 960)
				{
					this.removeEnemy(i);
				}
			}
		}
		
		public function enemyDestroyed(_index:uint):void
		{
			var tempX:uint = this._enemies[_index].x;
			var tempY:uint = this._enemies[_index].y;
			
			this.removeEnemy(_index);
		}
		
		public function get enemies():Vector.<Enemy>
		{
			return _enemies;
		}
		
		public function set enemies(value:Vector.<Enemy>):void
		{
			_enemies = value;
		}
	
	}

}
package Vertikill.Explosions
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class ExplosionController extends Sprite
	{        
		private var _explosions:Vector.<Explosion>;
		
		public function ExplosionController() 
        {
            _explosions = new Vector.<Explosion>();
        }
		
		// PRIVATE
		
		// PUBLIC
        
        public function addExplosion(_x:uint, _y:uint):void
        {
			// create a new explosion
            var explosion:Explosion = new Explosion(_x, _y, 0.5);
			
			// add explosion to vector of explosions
			this._explosions.push(explosion);
			
			// add to the screen
			this.addChild(explosion);
        }
		
	}

}
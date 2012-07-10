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
            var explosion:Explosion = new Explosion(_x, _y, 1);
			
			this._explosions.push(explosion);
            
			this.addChild(explosion);
        }
		
	}

}
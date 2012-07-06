package Vertikill.Explosions
{
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class ExplosionController extends Sprite
	{
	    // particle config
        [Embed(source="../../../media/particles/sun.pex", mimeType="application/octet-stream")]
        private static const SunConfig:Class;
        
        // particle textures
        [Embed(source = "../../../media/particles/sun_particle.png")]
        private static const SunParticle:Class;
		
		private var _explosions:Vector.<PDParticleSystem>;
        
		public function ExplosionController() 
        {
            _explosions = new Vector.<PDParticleSystem>();
        }
		
		// PRIVATE
		    
		private function _removeParticle(event:Event):void
        {
			trace('REMOVING PARTICLE');
			
            var ex:PDParticleSystem = event.target as PDParticleSystem;           
            ex.stop();
            Starling.juggler.remove(ex);
            removeChild(ex, true);
        }
		
		// PUBLIC
        
        public function addExplosion(_x:uint, _y:uint):void
        {
			var psConfig:XML = XML(new SunConfig());
            var psTexture:Texture = Texture.fromBitmap(new SunParticle());
            
            var explosion:PDParticleSystem = new PDParticleSystem(psConfig, psTexture);
			
            explosion.addEventListener(Event.COMPLETE, this._removeParticle);
						
			Starling.juggler.add(explosion);
			
			this._explosions.push(explosion);
            
			explosion.width = 20;
			explosion.height = 20;
			
			explosion.emitterX = _x;
            explosion.emitterY = _y;
            
			explosion.start();
            
			this.addChild(explosion);
        }
		
	}

}
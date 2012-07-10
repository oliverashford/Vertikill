package Vertikill.Explosions 
{
	import starling.core.Starling;
	import starling.extensions.PDParticleSystem;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Explosion extends PDParticleSystem
	{
	    // particle config
        [Embed(source="../../../media/particles/sun.pex", mimeType="application/octet-stream")]
        private static const SunConfig:Class;
        
        // particle textures
        [Embed(source = "../../../media/particles/sun_particle.png")]
        private static const SunParticle:Class;
		
		public function Explosion(_x:uint, _y:uint, _lifeTime:Number)
		{		
			trace('ADDING PARTICLE EMITTER');
			
			var psConfig:XML = XML(new SunConfig());
            var psTexture:Texture = Texture.fromBitmap(new SunParticle());		
			
			super(psConfig, psTexture);
			
            this.addEventListener(Event.COMPLETE, this._removeParticle);
						
			Starling.juggler.add(this);
			
			this.emitterX = _x;
            this.emitterY = _y;
            
			this.start(_lifeTime);
		}
		
		// PRIVATE
		    
		private function _removeParticle(event:Event):void
        {
			trace('REMOVING PARTICLE');
			
            Starling.juggler.remove(this);
            
			//removeChild(this, true);
        }
		
	}

}
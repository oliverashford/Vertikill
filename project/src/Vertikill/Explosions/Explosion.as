package Vertikill.Explosions 
{
	import starling.core.Starling;
	import starling.extensions.PDParticleSystem;
	import starling.events.Event;
	import starling.textures.Texture;
	
	import Vertikill.Assets;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Explosion extends PDParticleSystem
	{
	    // particle config
        [Embed(source="../../../media/particles/sun.pex", mimeType="application/octet-stream")]
        private static const SunConfig:Class;
        		
		public function Explosion(_x:uint, _y:uint, _lifeTime:Number)
		{					
			// get the particle xml config and the 
			var psConfig:XML = XML(new SunConfig());
            			
			super(psConfig, Assets.getTexture('SunParticle'));
			
            this.addEventListener(Event.COMPLETE, this._removeParticle);
						
			Starling.juggler.add(this);
			
			this.emitterX = _x;
            this.emitterY = _y;
            
			this.start(_lifeTime);
		}
		
		// PRIVATE
		    
		private function _removeParticle(event:Event):void
        {
            Starling.juggler.remove(this);
			
			//this.dispatchEvent(new Event(Event.COMPLETE));
        }
		
		// PUBLIC
		
	}

}
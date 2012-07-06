package Vertikill.Explosions 
{
	/**
	 * ...
	 * @author Oli Ashford
	 */
	public class Explosion 
	{
	    // particle config
        [Embed(source="../../../media/particles/sun.pex", mimeType="application/octet-stream")]
        private static const SunConfig:Class;
        
        // particle textures
        [Embed(source = "../../../media/particles/sun_particle.png")]
        private static const SunParticle:Class;
		
        private var mParticleSystem:ParticleSystem;
		
		public function Explosion(_x:uint, _y:uint) 
		{			
			// create particle system
            // (change first 2 lines to try out other configurations)
            
            var psConfig:XML = XML(new SunConfig());
            var psTexture:Texture = Texture.fromBitmap(new SunParticle());
            
            mParticleSystem = new PDParticleSystem(psConfig, psTexture);
            mParticleSystem.emitterX = _x;
            mParticleSystem.emitterY = _y;
            mParticleSystem.start();
            addChild(mParticleSystem);
			
			//mParticleSystem.stop();
			mParticleSystem.advanceTime(1);
			
			Starling.juggler.add(mParticleSystem);
		}
		
		
		
	}

}
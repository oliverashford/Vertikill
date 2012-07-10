package Vertikill
{
	import flash.utils.Dictionary;
	import flash.display.Bitmap;
	import starling.textures.TextureAtlas;
	
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Assets 
	{		
        // particle textures
        [Embed(source = "../../media/particles/sun_particle.png")]
        private static const SunParticle:Class;
		
		// sprites sheet
		[Embed(source="../../media/spritesheet.png")]
		private static const SpriteSheet:Class;
		
		[Embed(source="../../media/spritesheet.xml", mimeType="application/octet-stream")]
		private static const SpriteSheetXML:Class;
		
		private static var _textures:Dictionary = new Dictionary();
		private static var _atlus:TextureAtlas;
		
		public static function getAtlas():TextureAtlas
		{
			// has the atlus already been instantiated?
			if (_atlus == null)
			{
				// if it hasnt then load the sprite sheet and the xml describing it
				var texture:Texture = getTexture('SpriteSheet');
				var xml:XML = XML(new SpriteSheetXML());
				
				// create a new texture atlus
				_atlus = new TextureAtlas(texture, xml);
			}
			
			return _atlus;
		}
		
		// PUBLIC
		
		public static function getTexture(_name:String):Texture
		{
			// get a texture created from an embedded bitmap. Only create once though then add to dictionary for future use.
			
			// has the asset been embeded?
			if (Assets[_name] != undefined)
			{
				// has the texture already been instantiated
				if (_textures[_name] == undefined)
				{
					var bitmap:Bitmap = new Assets[_name]();
					_textures[_name] = Texture.fromBitmap(bitmap);
				}
				
				return _textures[_name];
			} 
			else 
			{
				throw new Error("getTexture() - Resource not defined.");
			}
		}		
	}
}
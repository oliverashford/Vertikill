package 
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
		[Embed(source = "../media/grass_1.png")]
		private static const Grass1:Class;
		
		[Embed(source = "../media/grass_2.png")]
		private static const Grass2:Class;
		
		[Embed(source = "../media/grass_3.png")]
		private static const Grass3:Class;
		
		[Embed(source = "../media/plane.png")]
		private static const Plane:Class;
		
		[Embed(source = "../media/bullet.png")]
		private static const Bullet:Class;
		
		[Embed(source="../media/spritesheet.png")]
		private static const SpriteSheet:Class;
		
		[Embed(source="../media/spritesheet.xml", mimeType="application/octet-stream")]
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
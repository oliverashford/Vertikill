package Vertikill.Collectibles 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class CollectibleController extends Sprite
	{
		private var _collectibles:Vector.<Collectible> = new Vector.<Collectible>;
		
		public function CollectibleController() 
		{
		}
		
		// PRIVATE
		
		private function _removed(_index:uint):void 
		{
			this.removeChild(this._collectibles[_index]);
			this._collectibles.splice(_index, 1);
		}
		
		// PUBLIC
		
		public function collected(_index:uint):void
		{			
			this._removed(_index);
		}
		
		public function addCollectible(_x:uint, _y:uint):void
		{
			var tempCollectible:Collectible = new Collectible();
			
			tempCollectible.x = _x;
			tempCollectible.y = _y;
			
			this.addChild(tempCollectible);
			
			this._collectibles.push(tempCollectible);
		}
		
		public function move():void
		{
			// move collectible
			for (var i:uint = 0; i < this._collectibles.length; i++)
			{
				this._collectibles[i].y += this._collectibles[i].dY;
				
				// check collectible position
				if (this._collectibles[i].y > 960)
				{
					this._removed(i);
				}
			}
		}
		
		public function get collectibles():Vector.<Collectible> 
		{
			return _collectibles;
		}
		
		public function set collectibles(value:Vector.<Collectible>):void 
		{
			_collectibles = value;
		}
	}

}
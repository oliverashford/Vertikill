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
			this.addCollectible();
		}
		
		// PRIVATE
		
		private function _removed(_index:uint):void 
		{
			this.removeChild(this._collectibles[_index]);
			this._collectibles.splice(_index, 1);
		}
		
		// PUBLIC
		
		public function destroyed(_index:uint):void
		{
			var tempX:uint = this._collectibles[_index].x;
			var tempY:uint = this._collectibles[_index].y;
			
			this._removed(_index);
		}
		
		public function addCollectible():void
		{
			var tempCollectible:Collectible = new Collectible();
			
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
	}

}
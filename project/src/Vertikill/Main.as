package Vertikill
{	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */

	[SWF(width = "640", height = "960", frameRate = "60", backgroundColor = "#ffffff")]
	 
	public class Main extends Sprite
	{		
		private var _starling:Starling;

		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;  
			stage.scaleMode = StageScaleMode.NO_SCALE;
				
			_starling = new Starling(Game, stage);
			_starling.start();
		}
	}
}
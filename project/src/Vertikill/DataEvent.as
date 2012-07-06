package Vertikill 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class DataEvent extends Event
	{
		public var params:Object;
		
		public function DataEvent(_type:String, _params:Object=null, _bubbles:Boolean=false) 
		{
			super(_type, _bubbles);
			this.params = _params;
		}
		
	}

}
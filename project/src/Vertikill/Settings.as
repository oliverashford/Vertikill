package Vertikill
{
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Settings 
	{	
		// background settings
		public static const BACKGROUND_START_SPEED:uint = 5;
		public static const BACKGROUND_SPEED_INCREASE_GAP:uint = 1000;
		
		//bullet settings
		public static const COL_COUNT:uint = 10;
		public static const COL_WIDTH:uint = 64;
		public static const SCREEN_HEIGHT:uint = 960;
		public static const BULLET_COUNTER_MAX:uint = 10;
		
		public static const ENEMY_COUNTER_MAX:uint = 200;
		
		// buttle settings
		public static const BULLET_SPEED:uint = 10;
		
		// enemy settings
		public static const ENEMIES:Object = {
			basic: [
				{
					name: 'Gun',
					damage: 10,
					rate: 10,
					dY: 10
				}
			]
		}		
		
		// weapon settings
		public static const WEAPONS:Object = {
			bullet: [
				{
					name: 'Gun',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Machine Gun',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Gun',
					damage: 10,
					rate: 10,
					dY: 19
				}
			],
			lazer: [
				{
					name: 'Green',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Red',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Blue',
					damage: 10,
					rate: 10,
					dY: 10
				}
			],
			flame: [
				{
					name: 'Match',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Lighter',
					damage: 10,
					rate: 10,
					dY: 10
				},
				{
					name: 'Hendrix',
					damage: 10,
					rate: 10,
					dY: 10
				}
			]
		};
	}
}
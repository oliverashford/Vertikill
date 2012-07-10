package Vertikill 
{	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import Vertikill.Collectibles.CollectibleController;	
	import Vertikill.Explosions.ExplosionController;
	import Vertikill.Enemies.EnemyController;
	import Vertikill.Bullets.BulletController;
	
	import fr.kouma.starling.utils.Stats;
	
	import starling.display.Stage;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Oli Ashford
	 */
	
	public class Game extends Sprite
	{		
		private var _background:Background;
		private var _player:Player;
		
		private var _enemyController:EnemyController;
		private var _explosionController:ExplosionController;
		private var _collectibleController:CollectibleController;
		private var _bulletController:BulletController;
		
		private var _goldCounter:GoldCounter = new GoldCounter;
		private var _distanceCounter:DistanceCounter = new DistanceCounter;
		
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		private var _width:Number;
		
		private var _lastFingerCol:Number;
				
		private var _enemyCounter:uint = 0;
		
		private var _backgroundSpeedCounter:uint = 0;
				
		public function Game() 
		{			
			this._width = Settings.COL_COUNT * Settings.COL_WIDTH;
			
			this.addEventListener(Event.ADDED_TO_STAGE, this._init);
		}
		
		// PRIVATE
		
		private function _init(_event:Event):void
		{
			var self:Game = this;
			
			// remove event listeneer
			this.removeEventListener(Event.ADDED_TO_STAGE, this._init);
									
			// set player starting col
			this._lastFingerCol = Math.floor(Settings.COL_COUNT / 2);
			
			//add Background scroller
			this._background = new Background(Settings.SCREEN_HEIGHT);
			this._background.addEventListener('MOVED', function(_event:DataEvent):void {
				self._distanceCounter.distance = self._distanceCounter.distance + _event.params.distance;
			});
			this.addChild(this._background);
			
			// add players plane
			this._player = new Player(this._lastFingerCol);
			this._player.addEventListener('FIRE_BULLET', function(_event:DataEvent):void {
				self._bulletController.addBullet(
					_event.params.x, 
					_event.params.y, 
					_event.params.dX, 
					_event.params.dY);
			});
			this.addChild(this._player);
			
			// add Explosion controller
			this._explosionController = new ExplosionController();
			this.addChild(this._explosionController);
			
			// add Collectible controller
			this._collectibleController = new CollectibleController();
			this.addChild(this._collectibleController);
			
			// add Bullet controller
			this._bulletController = new BulletController();
			this.addChild(this._bulletController);
			
			// add Enemy controller
			this._enemyController = new EnemyController();
			this.addChild(this._enemyController);
			
			// listen for touch events
			this.addEventListener(TouchEvent.TOUCH, this._onTouch);	
			
			// add stats
			this.addChild(new Stats());		
			
			// add gold counter
			this.addChild(_goldCounter);
			
			// add distance counter
			this.addChild(_distanceCounter);
			
			this._startGameLoop();
		}
		
		private function _startGameLoop():void
		{
			this.addEventListener(Event.ENTER_FRAME, this._onEnterFrame);
		}
		
		private function _onEnterFrame(_event:EnterFrameEvent):void
		{
			// update player
			this._player.update();
			
			// check if player needs to move
			if ((this._lastFingerCol < this._player.col) && (this._player.x >= 0))
			{
				// move left
				this._player.x -= this._player.dX;
			}
			else if ((this._lastFingerCol > this._player.col) && (this._player.x <= this._width))
			{
				// move right
				this._player.x += this._player.dX;
			}	
			
			// check enemy counter and if its time add an enemy
			this._enemyCounter++;
			
			if(this._enemyCounter == Settings.ENEMY_COUNTER_MAX)
			{
				this._enemyCounter	= 0;
				
				this._enemyController.addEnemy();
			}
			
			// check enemy counter and if its time add an enemy
			this._backgroundSpeedCounter++;
			
			if(this._backgroundSpeedCounter == Settings.BACKGROUND_SPEED_INCREASE_GAP)
			{
				this._backgroundSpeedCounter = 0;
				
				this._background.speed = this._background.speed + 1;
			}
						
			// move enemeies
			this._enemyController.moveEnemies();
			
			// test for bullet collision with enemies
			for (var i:uint = 0; i < this._bulletController.bullets.length; i++) 
			{
				for (var j:uint = 0; j < this._enemyController.enemies.length; j++ )
				{
					if (this._bulletController.bullets[i].bounds.intersects(this._enemyController.enemies[j].bounds))
					{
						// create explosion at the enemies location
						this._explosionController.addExplosion(this._enemyController.enemies[j].x, this._enemyController.enemies[j].y);
						
						// create collectibles
						this._collectibleController.addCollectible(this._enemyController.enemies[j].x, this._enemyController.enemies[j].y)
					
						// remove this enemy
						this._enemyController.enemyDestroyed(j);
					}
				}
			}
			
			// test for colectible collision with player
			for (var k:uint = 0; k < this._collectibleController.collectibles.length; k++) 
			{				
				if (this._collectibleController.collectibles[k].bounds.intersects(this._player.bounds))
				{
					// add gold value
					this._goldCounter.gold = this._goldCounter.gold + 10;
					
					// remove the collectible
					this._collectibleController.collected(k);
				}
			}
			
			// update bullets
			this._bulletController.update();
			
			// move collectibles
			this._collectibleController.move();
			
			// move background
			this._background.update();
		}

		private function _onTouch(_event:TouchEvent):void
		{
			// get the mouse location related to the stage
			var touch:Touch = _event.getTouch(stage);
			var pos:Point = touch.getLocation(stage);
		
			trace (touch.phase);
			
			// store the mouse coordinates
			this._mouseX = pos.x;
			this._mouseY = pos.y;
			
			// set currently selected col
			this._lastFingerCol = int(this._mouseX / Settings.COL_WIDTH);
			
			//trace('this._lastFingerCol:' + this._lastFingerCol);
		}
		
		// PUBLIC
	}
}
package Vertikill 
{	
	import flash.display.Bitmap;
	import flash.geom.Point;
	import Vertikill.Collectibles.CollectibleController;
	
	import Vertikill.Explosions.ExplosionController;
	import Vertikill.Enemies.EnemyController;
	
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
		private var _goldCounter:GoldCounter = new GoldCounter;
		private var _distanceCounter:DistanceCounter = new DistanceCounter;
		
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		private var _width:Number;
		
		private var _lastFingerCol:Number;
		
		private var _bulletCounter:uint = 0;
		
		private var _enemyCounter:uint = 0;
		
		private var _bullets:Vector.<Bullet> = new Vector.<Bullet>;
				
		public function Game() 
		{			
			this._width = Settings.COL_COUNT * Settings.COL_WIDTH;
			
			this.addEventListener(Event.ADDED_TO_STAGE, this._init);
		}
		
		private function _init(_event:Event):void
		{			
			// remove event listeneer
			this.removeEventListener(Event.ADDED_TO_STAGE, this._init);
									
			// set player starting col
			this._lastFingerCol = Math.floor(Settings.COL_COUNT / 2);
			
			//add Background scroller
			this._background = new Background(Settings.SCREEN_HEIGHT);
			this.addChild(this._background);
			
			// add players plane
			this._player = new Player(this._lastFingerCol);
			this.addChild(this._player);
			
			// add Explosion controller
			this._explosionController = new ExplosionController();
			this.addChild(this._explosionController);
			
			// add Collectible controller
			this._collectibleController = new CollectibleController();
			this.addChild(this._collectibleController);
			
			// add Enemy controller
			this._enemyController = new EnemyController(this._explosionController);
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
			
			// move enemeies
			this._enemyController.moveEnemies();
			
			// check bullet counter and if its time fire a bullet
			this._bulletCounter++;
			
			if(this._bulletCounter == Settings.BULLET_COUNTER_MAX)
			{
				this._bulletCounter	= 0;
				
				var tempBullet:Bullet = new Bullet(this._player.x, this._player.y);
				this._bullets.push(tempBullet);
				
				this.addChild(tempBullet);
			}
			
			// move bullets
			for (var i:uint = 0; i < this._bullets.length; i++) {
				this._bullets[i].y -= this._bullets[i].speed;
				
				// check bullets position
				if (this._bullets[i].y < 0) 
				{
					this.removeChild(this._bullets[i]);
					this._bullets.splice(i, 1);
				}
				
				// test for collision with enemies
				for (var j:uint = 0; j < this._enemyController.enemies.length; j++ )
				{
					if (this._bullets[i].bounds.intersects(this._enemyController.enemies[j].bounds))
					{
						this._enemyController.enemyDestroyed(j);
					}
				}
				
			}
			
			// move background
			this._background.move();
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
	}
}
package game {

	import flash.display.Sprite;
    import game.utils.Distance;

	public class Player extends Sprite {
		public var _distance:int = 0;

		public function Player() {

		}

        public function set distance (v:int) {
            this._distance = v;

            var point = Distance.toPoint(this._distance);

            this.x = point.x;
            this.y = point.y;
        }
	}

}

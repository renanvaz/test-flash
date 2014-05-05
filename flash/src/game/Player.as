package game {

	import flash.display.MovieClip;
    import game.utils.Distance;

	public class Player extends MovieClip {
		private var _distance:int = 0;

		public function Player() {

		}

        public function set distance (v:int):void {
            this._distance = v;

            var point = Distance.toPoint(this._distance);

            this.x = point.x;
            this.y = point.y;
        }

        public function get distance ():int {
            return this._distance;
        }
	}

}

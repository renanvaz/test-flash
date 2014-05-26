package game {

    import flash.display.MovieClip;
    import game.Global;

    public class Player extends MovieClip {
        private var _distance:int = 0;
        private var _ranking:int = 0;

        public function Player() {

        }

        public function set distance (v:int):void {
            this._distance = v;
        }

        public function get distance ():int {
            return this._distance;
        }

        public function set ranking (v:int):void {
            this._ranking = v;
        }

        public function get ranking ():int {
            return this._ranking;
        }
    }

}

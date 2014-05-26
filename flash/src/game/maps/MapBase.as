package game.maps {

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.geom.Point;
    import game.utils.Slice3;
    import game.Global;
    import game.Player;
    import game.Meta;

    public class MapBase extends Sprite {
        protected var _bgContainer:Sprite = new Sprite;
        protected var _playerContainer:Sprite = new Sprite;
        protected var _players:Array = [];
        protected var _metas:Array = [];

        public var follow:Player;

        public function MapBase (): void {
            this.addChild(this._bgContainer);
            this.addChild(this._playerContainer);
        }

        public function addPlayer (player:Player): void {
            this._players.push(player);
            this._playerContainer.addChild(player);
        }

        public function addMeta (meta:Meta): void {
            this._metas.push(meta);
            this._bgContainer.addChild(meta);
        }


        public function update (): void {
            var p:Point, count:int = 0;

            this._players.sortOn('distance', Array.DESCENDING);

            for each (var player:Player in this._players) {
                count++;

                if (player.ranking !== count) {
                    // Animate

                    player.ranking = count;
                }

                player.distance += ~~(Math.random() * 5);

                p = this.distanceToPoint(player.distance);

                player.x = p.x;
                player.y = p.y;

                player.gotoAndPlay(Global.map.distanceToOrientation(player.distance));

                player.parent.setChildIndex(player, player.parent.numChildren -1);
            }
        }

        public function draw (): void {}

        public function distanceToPoint (distance:int): Point { return new Point; }

        public function distanceToOrientation (distance:int): String { return ''; }

    }

}

package {

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.utils.Dictionary;
    import flash.geom.Point;

    import game.utils.*;
    import game.*;
    import fl.motion.Color;

    public class Main extends Sprite {
        private var tiles:Dictionary        = new Dictionary();
        private var players:Array 			= new Array;
        private var minY:int                = 0;

        public function Main() {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            Global.canvas = new Canvas;

            resize();
            minY = Math.floor(stage.stageHeight - (Global.tileSize / 2));

            var player = new Player;
            var player2 = new Player;

            var c:Color = new Color();
            c.setTint(0xFF0000, 0.5);
            player.transform.colorTransform = c;

            Global.canvas.addChild(player);
            Global.canvas.addChild(player2);

            players.push(player);
            players.push(player2);

            this.addChild(Global.canvas);

            stage.addEventListener(Event.ENTER_FRAME, update);
            stage.addEventListener(Event.RESIZE, onResize);
        }

        private function drawTiles (): void {
            var max:int,
                t:Tile,
                i:int,
                point:Point;

            max = 400;

            for (i = 0; i < max; i ++) {
                t = new Tile;
                //t.n.text = i.toString();

                point = Distance.toPoint(i * Global.tileSize);

                t.x = point.x;
                t.y = point.y;

                Global.canvas.bg.addChild(t);
                tiles[i] = t;
            }
        }

        private function update (e:Event): void {
            players.sortOn('distance', Array.DESCENDING);

            for each (var player:Player in players) {
                player.distance += ~~(Math.random() * 5);
                player.gotoAndPlay(Distance.toOrientation(player.distance));

                player.parent.setChildIndex(player, player.parent.numChildren -1);
            }

            Global.canvas.y = stage.stageHeight - 200 - player.y;
            Global.canvas.y = (Global.canvas.y < minY) ? minY : Global.canvas.y;
        }

        private function onResize (e:Event): void {
            resize();
        }

        private function resize (): void {
            Global.tileSize = 30;
            Global.tilesY   = 4;

            Global.canvasW  = Math.floor(stage.stageWidth / Global.tileSize) * Global.tileSize;

            for each (var t:Tile in tiles) {
                t.parent.removeChild(t);
            }

            drawTiles();

            Global.canvas.x = Math.round(((stage.stageWidth - Global.canvasW) / 2) + (Global.tileSize / 2));
        }
    }

}

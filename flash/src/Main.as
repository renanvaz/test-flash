package {

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.utils.Dictionary;
    import flash.geom.Point;

    import game.utils.*;
    import game.*;

    public class Main extends Sprite {
        private var tiles:Dictionary    = new Dictionary();
        private var player:Player       = new Player;

        public function Main() {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            Global.canvas = new Canvas;

            resize();

            Global.canvas.addChild(player);
            this.addChild(Global.canvas);

            stage.addEventListener(Event.ENTER_FRAME, update);
            stage.addEventListener(Event.RESIZE, onResize);
        }

        private function drawTiles (): void {
            var max:int,
                t:Tile,
                i:int,
                point:Point;

            max = 40;

            for (i = 0; i < max; i ++) {
                t = new Tile;
                t.n.text = i.toString();

                point = Distance.toPoint(i * Global.tileSize);

                t.x = point.x;
                t.y = point.y;

                Global.canvas.bg.addChild(t);
                tiles[i] = t;
            }
        }

        private function update (e:Event): void {
            player.distance++;

            trace(Distance.toOrientation(player.distance));
        }

        private function onResize (e:Event): void {
            resize();
        }

        private function resize (): void {
            Global.tileSize = 50;
            Global.tilesY   = 3;

            Global.canvasW  = Math.floor(stage.stageWidth / Global.tileSize) * Global.tileSize;

            for each (var t:Tile in tiles) {
                t.parent.removeChild(t);
            }

            drawTiles();

            Global.canvas.x = Math.round(((stage.stageWidth - Global.canvasW) / 2) + (Global.tileSize / 2));
            Global.canvas.y = stage.stageHeight - (Global.tileSize / 2);
        }
    }

}

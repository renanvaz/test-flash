package {

    import flash.display.Sprite;
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
            stage.scaleMode = StageScaleMode.NO_SCALE;

            Global.tileSize = 50;
            Global.tilesY   = 3
            Global.canvas   = new Sprite;
            Global.canvasW  = Math.floor(stage.stageWidth / Global.tileSize) * Global.tileSize;

            drawTiles();

            Global.canvas.addChild(player);

            Global.canvas.x = Math.round((stage.stageWidth - Global.canvasW) / 2);

            stage.addEventListener(Event.ENTER_FRAME, update);
        }

        private function drawTiles (): void {
            var max:int,
                t:Tile,
                i:int,
                point:Point;

            for (i = 0; i < 40; i ++) {
                t = new Tile;
                t.n.text = i.toString();

                point = Distance.toPoint(i * Global.tileSize);

                t.x = point.x;
                t.y = point.y;

                Global.canvas.addChild(t);
                tiles[i] = t;
            }
        }



        private function update (e:Event): void {
            player.distance++;
        }
    }

}

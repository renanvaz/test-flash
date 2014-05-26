package {

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.utils.Dictionary;
    import flash.geom.Point;

    import game.utils.*;
    import game.*;
    import game.maps.*;
    import fl.motion.Color;
    import flash.display.Bitmap;

    public class Main extends Sprite {

        public var player:Player;
        public var player2:Player;
        public var grass:Slice3;
        public var mapContainer:Sprite;

        public function Main() {
            grass = new Slice3(new Bitmap(new Grass), 1, 400 - 2);


            addChild(grass);
            grass.width = stage.stageWidth;
            grass.height = stage.stageHeight;

            stage.align = StageAlign.BOTTOM_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            player = new Player;
            player2 = new Player;

            this.mapContainer = new Sprite;

            Global.map = new ZigZag;
            Global.map.follow = player;

            resize();

            var c:Color = new Color();
            c.setTint(0xFF0000, 0.5);
            player.transform.colorTransform = c;

            Global.map.addPlayer(player);
            Global.map.addPlayer(player2);

            mapContainer.addChild(Global.map);

            this.addChild(mapContainer);

            stage.addEventListener(Event.ENTER_FRAME, update);
            stage.addEventListener(Event.RESIZE, onResize);
        }

        private function drawTiles (): void {

        }

        private function update (e:Event): void {
            Global.map.update();
        }

        private function onResize (e:Event): void {
            resize();
        }

        private function resize (): void {
            Global.canvasW = 480;
            Global.canvasH = stage.stageHeight;

            this.mapContainer.x = (stage.stageWidth - Global.canvasW) / 2;

            trace(this.mapContainer.x);

            grass.width = stage.stageWidth;
            grass.height = stage.stageHeight;

            Global.map.draw();
        }
    }

}

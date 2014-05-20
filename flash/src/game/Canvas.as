package game {

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import game.utils.Scale3;

    public class Canvas extends Sprite {
        public var bg:Sprite = new Sprite;
        private var _ground:Scale3;

        public function Canvas() {
            this._ground = new Scale3(new Bitmap(new TileMap), 96, 32);
            this._ground.scaleY = -1;
            this.addChild(this._ground);
            this.addChild(this.bg);
        }

        public function draw () {
            this._ground.width = Global.canvasW + Global.tileSize * 2;
            this._ground.height = Global.canvasH;
            this._ground.x = -(Global.tileSize + (Global.tileSize / 2));
            this._ground.y = (Global.tileSize + Global.tileSize / 2);
        }

    }

}

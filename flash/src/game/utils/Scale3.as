package game.utils {

    import flash.geom.Rectangle;
    import flash.display.Bitmap;
	import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Matrix;

	public class Scale3 extends Sprite{

        private var _b:Bitmap;

        private var _left:Bitmap;
        private var _center:Bitmap;
        private var _right:Bitmap;

        private var _width:Number;
        private var _height:Number;

        function Scale3 (b:Bitmap, _x:Number, _w:Number):void {
            var matrix:Matrix = new Matrix(),
                _bd:BitmapData;

            this._b = b;

            _bd = new BitmapData(_x, this._b.height, true, 0x00000000);
            _bd.draw(this._b);
            this._left = new Bitmap(_bd);

            _bd = new BitmapData(_w, this._b.height, true, 0x00000000);
            matrix.translate(-_x, 0);
            _bd.draw(this._b, matrix);
            this._center = new Bitmap(_bd);

            _bd = new BitmapData(this._b.width - (_x + _w), this._b.height, true, 0x00000000);
            matrix.translate(-_w, 0); // Sum
            _bd.draw(this._b, matrix);
            this._right = new Bitmap(_bd);

            this.addChild(this._left);
            this.addChild(this._center);
            this.addChild(this._right);

            this.draw();
        }

        private function draw ():void {
            this._left.x    = 0;
            this._center.x  = _x;
            this._right.x   = _x + _w;
        }

        public override function set width (v:Number):void {
            this._width = v;
        }

        public override function get width ():Number {
            return this._width;
        }

        public override function set height (v:Number):void {
            this._height = v;
        }

        public override function get height ():Number {
            return this._height;
        }
    }

}

package game.utils {

    import flash.geom.Rectangle;
    import flash.display.Bitmap;
	import flash.display.BitmapData;
    import flash.display.Sprite;
	import flash.display.Shape;
    import flash.geom.Matrix;

	public class Slice3 extends Sprite{

        private var _b:Bitmap;

        private var _bleft:Bitmap;
        private var _bcenter:Bitmap;
        private var _bright:Bitmap;
        private var _canvas:Sprite = new Sprite;

        private var _width:Number;
        private var _height:Number;

        function Slice3 (b:Bitmap, _x:Number, _w:Number):void {
            var _matrix:Matrix,
                _bd:BitmapData;

            this._b = b;

            _matrix = new Matrix();

            _bd = new BitmapData(_x, this._b.height, true, 0x00000000);
            _bd.draw(this._b);
            this._bleft = new Bitmap(_bd);

            _bd = new BitmapData(_w, this._b.height, true, 0x00000000);
            _matrix.translate(-_x, 0);
            _bd.draw(this._b, _matrix);
            this._bcenter = new Bitmap(_bd);

            _bd = new BitmapData(this._b.width - (_x + _w), this._b.height, true, 0x00000000);
            _matrix.translate(-_w, 0); // Sum
            _bd.draw(this._b, _matrix);
            this._bright = new Bitmap(_bd);

            this.addChild(this._canvas);

            this._width = this._b.width;
            this._height = this._b.height;

            this.draw();
        }

        private function draw ():void {
            var _s:Shape,
                _matrix:Matrix,
                _bd:BitmapData,
                _b:Bitmap;

            _s      = new Shape;
            _matrix = new Matrix;
            _bd     = new BitmapData(this.width, this._bcenter.height, false, 0x00000000);

            _s.graphics.beginBitmapFill(this._bcenter.bitmapData);
            _s.graphics.drawRect(0, 0, this.width - this._bleft.width - this._bright.width, this._bcenter.height);
            _s.graphics.endFill();

            _bd.draw(this._bleft.bitmapData);

            _matrix.translate(this._bleft.width, 0);
            _bd.draw(_s, _matrix);

            _matrix.translate(this.width - this._bleft.width - this._bright.width, 0);
            _bd.draw(this._bright, _matrix);

            _b      = new Bitmap(_bd);
            _s      = new Shape;
            _bd     = new BitmapData(this.width, this.height, true, 0x00000000);

            _s.graphics.beginBitmapFill(_b.bitmapData);
            _s.graphics.drawRect(0, 0, this.width, this.height);
            _s.graphics.endFill();

            _bd.draw(_s);
            _b = new Bitmap(_bd);

            while(this._canvas.numChildren) { this._canvas.removeChildAt(0); }

            this._canvas.addChild(_b);
        }

        public override function set width (v:Number):void {
            this._width = v;

            this.draw();
        }

        public override function get width ():Number {
            return this._width;
        }

        public override function set height (v:Number):void {
            this._height = v;

            this.draw();
        }

        public override function get height ():Number {
            return this._height;
        }

        public function get initialWidth ():Number {
            return this._b.width;
        }

        public function get initialHeight ():Number {
            return this._b.height;
        }
    }

}

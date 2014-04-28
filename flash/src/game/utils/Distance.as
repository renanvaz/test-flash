package game.utils {

    import flash.geom.Point;
    import game.Global;

    public class Distance {

		static public function toPoint (distance:int): Point {
            var max:int,
                tX:int,             // Max tiles in X axis
                tY:int,             // Max tiles in Y axis
                p:Point,            // Point
                stoped_oX:Boolean,  // Not move in x axis
                oX:int;             // Orientation in X axis, -1 (left) and 1 (right)

            tX = Global.canvasW - Global.tileSize;
            tY = (Global.tilesY * Global.tileSize) - Global.tileSize;
            oX = 0;
            p = new Point;

            oX = (distance % ((tX + tY) * 2)) < (tX + tY) ? 1 : -1;
            stoped_oX = !(distance % (tX + tY) < (tX));

            if (stoped_oX) {
                p.x = oX === -1 ? 0 : tX;
            } else {
                p.x = distance % (tX + tY);

                if (oX === -1) {
                    p.x = (tX - p.x);
                }
            }

            p.y = Math.floor(distance / (tX + tY)) * tY;

            if (distance % (tX + tY) >= tX) {
                p.y += (distance % (tX + tY)) - tX;
            }

            return p;
        }

	}

}

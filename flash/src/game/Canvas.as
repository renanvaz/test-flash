package game {

	import flash.display.Sprite;

	public class Canvas extends Sprite {
		public var bg:Sprite = new Sprite;

		public function Canvas() {
            this.addChild(this.bg);
		}

	}

}

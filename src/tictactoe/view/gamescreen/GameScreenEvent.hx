/**
 * COMMENT
 * @author
 */
package tictactoe.view.gamescreen;

import flash.events.Event;

class GameScreenEvent extends Event {

	static public var CELL_CLICK : String = "cellClick";
	public var xCell : Int;
	public var yCell : Int;
	public function new(type : String, xCell : Int, yCell : Int) {
		super(type);
		this.xCell = xCell;
		this.yCell = yCell;
	}

}


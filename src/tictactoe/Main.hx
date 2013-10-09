//import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
/**
 * Main application class.
 */
package tictactoe;

import flash.display.Sprite;
import flash.events.Event;

@:meta(Frame(factoryClass="ticTacToe.Preloader"))
class Main extends Sprite {

	var module : MainModule;
	public function new() {
		if(stage)  {
			init();
		}

		else  {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

	}

	function init(event : Event = null) : Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
		//CONFIG::debug {
		//MvcExpressLogger.init(this.stage);
		//}
		// entry point
		module = new MainModule();
		module.start(this);
	}

}


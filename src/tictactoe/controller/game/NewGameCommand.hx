/**
 * TODO:CLASS COMMENT
 * @author
 */
package tictactoe.controller.game;

import mvcexpress.mvc.Command;
import tictactoe.model.GameBoardProxy;
import tictactoe.model.GameProxy;

class NewGameCommand extends Command {

	@:meta(Inject())
	public var gameBoardProxy : GameBoardProxy;
	@:meta(Inject())
	public var gameProxy : GameProxy;
	public function execute(params : Dynamic) : Void {
		gameBoardProxy.clearBoard();
		gameProxy.enable();
	}

}


/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
package tictactoe.controller.setup;

import mvcexpress.mvc.Command;
import tictactoe.controller.game.CellClickCommand;
import tictactoe.controller.game.NewGameCommand;
import tictactoe.messages.ViewMsg;

class SetupControllerCommand extends Command {

	public function execute(params : Dynamic) : Void {
		commandMap.map(ViewMsg.CELL_CLICKED, CellClickCommand);
		commandMap.map(ViewMsg.NEW_GAME_CLICKED, NewGameCommand);
	}

}


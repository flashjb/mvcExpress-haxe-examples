/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author
 */
package tictactoe.controller.setup;

import mvcexpress.mvc.Command;
import tictactoe.Main;
import tictactoe.view.gamescreen.GameScreen;
import tictactoe.view.gamescreen.GameScreenMediator;
import tictactoe.view.main.MainMediator;

class SetupViewCommand extends Command {

	public function execute(params : Dynamic) : Void {
		mediatorMap.map(Main, MainMediator);
		mediatorMap.map(GameScreen, GameScreenMediator);
	}

}


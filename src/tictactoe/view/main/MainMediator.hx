/**
 * Mediator for aplication root view object.
 */
package tictactoe.view.main;

import mvcexpress.mvc.Mediator;
import tictactoe.Main;
import tictactoe.view.gamescreen.GameScreen;

class MainMediator extends Mediator {

	@inject
	public var view : Main;
	var gameScreen : GameScreen;
	override function onRegister() : Void {
		gameScreen = new GameScreen();
		view.addChild(gameScreen);
		mediatorMap.mediate(gameScreen);
	}

	override function onRemove() : Void {
		mediatorMap.unmediate(gameScreen);
		view.removeChild(gameScreen);
	}

}


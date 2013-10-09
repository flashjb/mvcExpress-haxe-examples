/**
 * TODO:CLASS COMMENT
 * @author
 */
package tictactoe.view.gamescreen;

import flash.events.MouseEvent;
import flash.geom.Point;
import mvcexpress.mvc.Mediator;
import tictactoe.messages.DataMsg;
import tictactoe.messages.ViewMsg;
import tictactoe.model.GameBoardProxy;
import tictactoe.model.LineVO;

class GameScreenMediator extends Mediator {

	@:meta(Inject())
	public var view : GameScreen;
	@:meta(Inject())
	public var gameBoardProxy : GameBoardProxy;
	override function onRegister() : Void {
		//trace("GameScreenMediator.onRegister");
		//
		view.addEventListener(GameScreenEvent.CELL_CLICK, handleCellClick);
		view.newGameDispatcher.addEventListener(MouseEvent.CLICK, handleNewGameClick);
		addHandler(DataMsg.CELL_SET, handleCellSet);
		addHandler(DataMsg.BOARD_CLEARED, handleBoardCleared);
		addHandler(DataMsg.LINE_FOUND, handleLineFound);
	}

	function handleCellClick(event : GameScreenEvent) : Void {
		sendMessage(ViewMsg.CELL_CLICKED, new Point(event.xCell, event.yCell));
	}

	function handleNewGameClick(event : MouseEvent) : Void {
		//trace("GameScreenMediator.handleNewGameClick > event : " + event);
		sendMessage(ViewMsg.NEW_GAME_CLICKED);
	}

	public function handleCellSet(cellCords : Point) : Void {
		view.addToken(cellCords, gameBoardProxy.getCellToken(cellCords));
	}

	function handleBoardCleared(params : Dynamic) : Void {
		view.clearBoard();
	}

	function handleLineFound(lineVo : LineVO) : Void {
		view.drawLine(lineVo.fromPos, lineVo.toPos);
	}

	override function onRemove() : Void {
	}

}


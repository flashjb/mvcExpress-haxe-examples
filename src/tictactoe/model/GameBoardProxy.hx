/**
 * Game board state proxy.
 */
package tictactoe.model;

import flash.geom.Point;
import mvcexpress.mvc.Proxy;
import tictactoe.constants.TokenId;
import tictactoe.messages.DataMsg;

class GameBoardProxy extends Proxy {

	var boardData : Array<Array<Int>>;
	public function new() {
	}

	override function onRegister() : Void {
		boardData = new Array<Array<Int>>();
		var i : Int = 0;
		while(i < boardData.length) {
			boardData[i] = new Array<Int>();
			i++;
		}
	}

	override function onRemove() : Void {
		boardData = null;
	}

	public function isCellEmpty(cellCords : Point) : Bool {
		return (boardData[cellCords.x][cellCords.y] == TokenId.TAC);
	}

	public function setCellToken(cellCords : Point, tockenId : Int) : Void {
		boardData[cellCords.x][cellCords.y] = tockenId;
		sendMessage(DataMsg.CELL_SET, cellCords);
	}

	public function getCellToken(cellCords : Point) : Int {
		return boardData[cellCords.x][cellCords.y];
	}

	public function clearBoard() : Void {
		var i : Int = 0;
		while(i < boardData.length) {
			var j : Int = 0;
			while(j < boardData[i].length) {
				boardData[i][j] = 0;
				j++;
			}
			i++;
		}
		sendMessage(DataMsg.BOARD_CLEARED);
	}

	public function findLine() : LineVO {
		var retVal : LineVO;
		var lineToken : Int;
		// search horizontals
		var j : Int = 0;
		while(j < boardData.length) {
			lineToken = boardData[0][j];
			if(lineToken && lineToken == boardData[1][j] && lineToken == boardData[2][j])  {
				retVal = new LineVO();
				retVal.fromPos = new Point(0, j);
				retVal.toPos = new Point(2, j);
				retVal.tokenId = lineToken;
				break;
			}
			j++;
		}
		// search verticals
		var i : Int = 0;
		while(i < boardData.length) {
			lineToken = boardData[i][0];
			if(lineToken && lineToken == boardData[i][1] && lineToken == boardData[i][2])  {
				retVal = new LineVO();
				retVal.fromPos = new Point(i, 0);
				retVal.toPos = new Point(i, 2);
				retVal.tokenId = lineToken;
				break;
			}
			i++;
		}
		// search diagonals
		lineToken = boardData[1][1];
		if(lineToken && lineToken == boardData[0][0] && lineToken == boardData[2][2])  {
			retVal = new LineVO();
			retVal.fromPos = new Point(0, 0);
			retVal.toPos = new Point(2, 2);
			retVal.tokenId = lineToken;
		}
		if(lineToken && lineToken == boardData[2][0] && lineToken == boardData[0][2])  {
			retVal = new LineVO();
			retVal.fromPos = new Point(2, 0);
			retVal.toPos = new Point(0, 2);
			retVal.tokenId = lineToken;
		}
		if(retVal)  {
			sendMessage(DataMsg.LINE_FOUND, retVal);
		}
		return retVal;
	}

}


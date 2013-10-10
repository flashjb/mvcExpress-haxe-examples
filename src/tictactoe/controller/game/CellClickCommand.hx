/**
 * TODO:CLASS COMMENT
 * @author
 */
package tictactoe.controller.game;

import flash.geom.Point;
import mvcexpress.mvc.Command;
import tictactoe.model.GameBoardProxy;
import tictactoe.model.GameProxy;
import tictactoe.model.LineVO;

class CellClickCommand extends Command {

	@inject
	public var gameBoardProxy : GameBoardProxy;
	
	@inject
	public var gameProxy : GameProxy;
	
	public function new (){
		super();
	}
	
	
	public function execute(cellCords : Point) : Void 
	{
		trace( "CellClickCommand.execute > cellCords : " + cellCords );
		if(gameProxy.getIsEnabled())  {
			if(gameBoardProxy.isCellEmpty(cellCords))  {
				//
				gameBoardProxy.setCellToken(cellCords, gameProxy.getCurrentToken());
				gameProxy.switchCurrentToken();
				//
				var lineVo : LineVO = gameBoardProxy.findLine();
				if( lineVo != null )  {
					trace("lineVo : " + lineVo);
					// block game...
					gameProxy.disable();
				}
			}
		}
	}

}


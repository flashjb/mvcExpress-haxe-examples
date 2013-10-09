/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
package tictactoe.controller.setup;

import mvcexpress.mvc.Command;
import tictactoe.model.GameBoardProxy;
import tictactoe.model.GameProxy;

class SetupModelCommand extends Command {

	public function execute(params : Dynamic) : Void {
		proxyMap.map(new GameProxy());
		proxyMap.map(new GameBoardProxy());
	}

}


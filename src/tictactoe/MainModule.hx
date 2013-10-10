/**
 * Main application module.
 * Sets up application and starts it.
 */
package tictactoe;

import mvcexpress.MvcExpress;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.MvcExpressTools;
import tictactoe.controller.setup.SetupControllerCommand;
import tictactoe.controller.setup.SetupModelCommand;
import tictactoe.controller.setup.SetupViewCommand;
import tictactoe.messages.DataMsg;
import tictactoe.messages.Msg;
import tictactoe.messages.ViewMsg;

class MainModule extends ModuleCore {

	override function onInit() : Void {
		// little utility to prevent accidental message constant dublications.
		#if debug
			MvcExpressTools.checkClassStringConstants([Msg, DataMsg, ViewMsg]);
		//	MvcExpress.debugFunction = Trace;
		#end

		// map commands
		commandMap.execute(SetupControllerCommand);
		// map proxies (and services)
		commandMap.execute(SetupModelCommand);
		// map modiators
		commandMap.execute(SetupViewCommand);
	}

	public function start(main : Main) : Void {
		//trace("Hello mvcExpress!!!");
		// mediate main view.
		mediatorMap.mediate(main);
	}

}


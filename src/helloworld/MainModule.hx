/**
 * Main application module.
 * Sets up application and starts it.
 */
package helloworld;

import flash.geom.Point;
import helloworld.controller.setup.SetupControllerCommand;
import helloworld.controller.setup.SetupModelCommand;
import helloworld.controller.setup.SetupViewCommand;
import helloworld.messages.DataMsg;
import helloworld.messages.Msg;
import helloworld.messages.ViewMsg;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.MvcExpressTools;

class MainModule extends ModuleCore {

	override function onInit() : Void 
	{
		trace("MainModule.onInit");
		
		// little utility to prevent accidental message constant dublications.
		#if debug
			MvcExpressTools.checkClassStringConstants( [Msg, DataMsg, ViewMsg] );
		#end
		
		// map commands (you can map them here.. or move it to command.)
		commandMap.execute(SetupControllerCommand);
		// map proxies (and services)(you can map them here.. or move it to command.)
		commandMap.execute(SetupModelCommand);
		// map mediators(you can map them here.. or move it to command.)
		commandMap.execute(SetupViewCommand);
	}

	public function start(main : Main) : Void {
		trace("MainModule.start > main : " + main);
		// mediate main view.
		mediatorMap.mediate(main);
		// send a message for execution test.
		// messages can be sent from modules, commands, proxies and mediators.
		// messages can execute commands, and be handled by mediators.
		// params object is optional.
		sendMessage(Msg.TEST, new Point(1, 5));
		trace("Hello mvcExpress!!!");
	}

}


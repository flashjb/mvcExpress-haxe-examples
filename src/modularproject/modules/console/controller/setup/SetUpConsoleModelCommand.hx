/**
 * set up model
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller.setup;

import modularproject.modules.console.model.ConsoleLogProxy;
import mvcexpress.mvc.Command;

class SetUpConsoleModelCommand extends Command {

	public function execute(consoleId : Int) : Void {
		proxyMap.map(new ConsoleLogProxy(consoleId));
	}

}


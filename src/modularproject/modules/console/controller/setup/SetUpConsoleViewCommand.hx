/**
 * set up view
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller.setup;

import modularproject.modules.console.Console;
import modularproject.modules.console.view.ConsoleMediator;
import mvcexpress.mvc.Command;

class SetUpConsoleViewCommand extends Command {

	public function execute(blank : Dynamic) : Void {
		mediatorMap.map(Console, ConsoleMediator);
	}

}


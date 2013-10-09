/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller.setup;

import modularproject.modules.console.Console;
import mvcexpress.mvc.Command;

class InitConsoleCommand extends Command {

	public function execute(main : Console) : Void {
		// start main view.
		mediatorMap.mediate(main);
	}

}


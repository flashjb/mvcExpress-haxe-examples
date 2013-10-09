/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller;

import modularproject.modules.console.model.ConsoleLogProxy;
import mvcexpress.mvc.Command;

class HandleInputCommand extends Command {

	@:meta(Inject())
	public var consoleLogProxy : ConsoleLogProxy;
	public function execute(messageText : String) : Void {
		//trace("HandleInputCommand.execute > messageText : " + messageText);
		consoleLogProxy.pushMessage(messageText);
	}

}


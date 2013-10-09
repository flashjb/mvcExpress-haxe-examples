/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller;

import modularproject.modules.console.model.ConsoleLogProxy;
import modularproject.modules.console.msg.ConsoleViewMessages;
import modularproject.modules.console.view.ConsoleParams;
import mvcexpress.mvc.Command;

class HandleTargetedMessageCommand extends Command {

	@:meta(Inject())
	public var consoleLogProxy : ConsoleLogProxy;
	public function execute(consoleParams : ConsoleParams) : Void {
		var i : Int = 0;
		while(i < consoleParams.targetConsoleIds.length) {
			if(consoleParams.targetConsoleIds[i] == consoleLogProxy.consoleId)  {
				sendMessage(ConsoleViewMessages.INPUT_MESSAGE, consoleParams.text);
				break;
			}
			i++;
		}
	}

}


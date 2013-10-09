/**
 * set up commands
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.controller.setup;

import modularproject.global.ScopeNames;
import modularproject.global.messages.GlobalMessage;
import modularproject.modules.console.controller.HandleInputCommand;
import modularproject.modules.console.controller.HandleTargetedMessageCommand;
import modularproject.modules.console.msg.ConsoleViewMessages;
import mvcexpress.extensions.scoped.mvc.CommandScoped;

class SetUpConsoleControllerCommand extends CommandScoped {

	public function execute(blank : Dynamic) : Void {
		commandMap.map(ConsoleViewMessages.INPUT_MESSAGE, HandleInputCommand);
		commandMapScoped.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMapScoped.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);
	}

}


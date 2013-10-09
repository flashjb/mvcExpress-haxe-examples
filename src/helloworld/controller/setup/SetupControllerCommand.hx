/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
package helloworld.controller.setup;

import helloworld.controller.test.TestCommand;
import helloworld.messages.Msg;
import mvcexpress.mvc.Command;

class SetupControllerCommand extends Command {

	public function execute(blank : Dynamic) : Void {
		trace("SetupControllerCommand.execute > blank : " + blank);
		// map a command to message string.
		// command class will be executed then messange with that string is sent.
		commandMap.map(Msg.TEST, TestCommand);
	}

}


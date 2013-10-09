/**
 * set permision te receive messages to this scope. Commands use received messages to trigger.
 * @author rbanevicius
 */
package modularproject.modules.console.controller.setup;

import modularproject.global.ScopeNames;
import mvcexpress.extensions.scoped.mvc.CommandScoped;
import mvcexpress.mvc.Command;

class SetUpConsolePermissionsCommand extends CommandScoped {

	public function execute(blank : Dynamic) : Void {
		registerScope(ScopeNames.CONSOLE_SCOPE, false, true);
	}

}


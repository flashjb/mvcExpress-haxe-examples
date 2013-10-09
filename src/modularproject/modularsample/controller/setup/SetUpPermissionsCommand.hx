/**
 * set permision te send messages to this scope.
 * @author rbanevicius
 */
package modularproject.modularsample.controller.setup;

import modularproject.global.ScopeNames;
import mvcexpress.extensions.scoped.mvc.CommandScoped;
import mvcexpress.mvc.Command;

class SetUpPermissionsCommand extends CommandScoped {

	public function execute(blank : Dynamic) : Void {
		//
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);
	}

}


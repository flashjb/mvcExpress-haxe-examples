/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
package modularproject.modularsample.controller.setup;

import modularproject.modularsample.ModularSample;
import modularproject.modularsample.view.ModularSampleMediator;
import mvcexpress.mvc.Command;

class SetUpViewCommand extends Command {

	public function execute(blank : Dynamic) : Void {
		mediatorMap.map(ModularSample, ModularSampleMediator);
	}

}


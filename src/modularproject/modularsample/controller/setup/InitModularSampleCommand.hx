/**
 * init medule
 * @author rbanevicius
 */
package modularproject.modularsample.controller.setup;

import modularproject.modularsample.ModularSample;
import mvcexpress.mvc.Command;

class InitModularSampleCommand extends Command {

	public function execute(main : ModularSample) : Void {
		// mediate module object.
		mediatorMap.mediate(main);
	}

}


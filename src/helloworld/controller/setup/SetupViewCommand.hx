/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author
 */
package helloworld.controller.setup;

import helloworld.Main;
import helloworld.view.main.MainMediator;
import mvcexpress.mvc.Command;

class SetupViewCommand extends Command {

	public function execute(blank : Dynamic) : Void {
		trace("SetupViewCommand.execute > blank : " + blank);
		// Will map mediator class to view class.
		// Mediator(MainMediator) will be automaticaly created every time you will try to mediatorMap.mediate() viewObject of mapped class(Main).
		mediatorMap.map(Main, MainMediator);
	}

}


/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
package helloworld.controller.setup;

import helloworld.model.TestProxy;
import mvcexpress.mvc.Command;

class SetupModelCommand extends Command {

	public function execute(blank : Dynamic) : Void {
		trace("SetupModelCommand.execute > blank : " + blank);
		// construct and map a proxy object for injection.
		// after this you will be able to [Inject] proxies in your commands, mediators and ather proxies.
		proxyMap.map(new TestProxy());
	}

}


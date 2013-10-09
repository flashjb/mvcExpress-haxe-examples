/**
 * Blank service.
 * Service technicaly is just another proxy.
 * But conceptualy we use services to hadle remote data or other asincronous data manipulations.
 */
package tictactoe.services;

import mvcexpress.mvc.Proxy;

class BlankService extends Proxy {

	public function new() {
	}

	override function onRegister() : Void {
	}

	override function onRemove() : Void {
	}

}


/**
 * TODO:CLASS COMMENT
 * @author
 */
package tictactoe.model;

import mvcexpress.mvc.Proxy;
import tictactoe.constants.TokenId;

class GameProxy extends Proxy {

	var currentToken : Int ;
	var isEnabled 	 : Bool ;
	
	override public function onRegister() : Void {
		currentToken = TokenId.TIC;
		isEnabled = true;
	}
	
	// current token
	public function switchCurrentToken() : Void {
		currentToken *= -1;
	}

	public function getCurrentToken() : Int {
		return currentToken;
	}

	// game enabled
	public function disable() : Void {
		isEnabled = false;
	}

	public function enable() : Void {
		isEnabled = true;
	}

	public function getIsEnabled() : Bool {
		return isEnabled;
	}

}


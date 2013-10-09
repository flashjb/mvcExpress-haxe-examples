/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.model;

import modularproject.modules.console.msg.ConsoleDataMessages;
import mvcexpress.mvc.Proxy;

class ConsoleLogProxy extends Proxy {
	public var consoleId(getConsoleId, never) : Int;

	var messageList : Array<String>;
	var _consoleId : Int;
	public function new(_consoleId : Int) {
		messageList = new Array<String>();
		this._consoleId = _consoleId;
	}

	public function pushMessage(messageText : String) : Void {
		messageList.push(messageText);
		sendMessage(ConsoleDataMessages.MESSAGE_ADDED, messageText);
	}

	override function onRegister() : Void {
		trace("ConsoleLogProxy.onRegister");
	}

	override function onRemove() : Void {
		trace("ConsoleLogProxy.onRemove");
	}

	public function getConsoleId() : Int {
		return _consoleId;
	}

}


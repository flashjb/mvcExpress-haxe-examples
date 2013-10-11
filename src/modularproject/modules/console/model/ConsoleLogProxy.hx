/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.model;

import modularproject.modules.console.msg.ConsoleDataMessages;
import mvcexpress.mvc.Proxy;

class ConsoleLogProxy extends Proxy
{
	public var consoleId(get_consoleId, never) : Int;

	var messageList : Array<String>;
	var _consoleId : Int;
	
	public function new(_consoleId : Int) 
	{
		super();
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

	public function get_consoleId() : Int {
		return _consoleId;
	}

}


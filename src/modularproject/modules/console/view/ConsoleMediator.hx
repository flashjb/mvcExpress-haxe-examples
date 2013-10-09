/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.view;

import flash.events.MouseEvent;
import modularproject.modules.console.Console;
import modularproject.modules.console.msg.ConsoleDataMessages;
import modularproject.modules.console.msg.ConsoleViewMessages;
import mvcexpress.mvc.Mediator;

class ConsoleMediator extends Mediator {

	@:meta(Inject())
	public var view : Console;
	override function onRegister() : Void {
		trace("ConsoleMediator.onRegister");
		view.inputBtn.addEventListener(MouseEvent.CLICK, handleInputText);
		addHandler(ConsoleDataMessages.MESSAGE_ADDED, handleMessageAdded);
		//addRemoteHandler(GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL_DONT_STORE, handleMessageAdded, ModuleNames.SHELL);
	}

	override function onRemove() : Void {
		trace("ConsoleMediator.onRemove");
	}

	function handleInputText(event : MouseEvent) : Void {
		trace("Console.handleTextInput > event : " + event);
		if(view.inputTf.text)  {
			sendMessage(ConsoleViewMessages.INPUT_MESSAGE, view.inputTf.text);
			view.inputTf.text = "";
		}

		else  {
			sendMessage(ConsoleViewMessages.EMPTY_MESSAGE, "NO MESSAGE ENTERED!!.....");
		}

	}

	function handleMessageAdded(message : String) : Void {
		view.outputTf.text += message + "
";
		view.outputTf.textField.scrollV = view.outputTf.textField.maxScrollV;
	}

}


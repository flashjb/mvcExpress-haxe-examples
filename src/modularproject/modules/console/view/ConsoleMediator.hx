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

class ConsoleMediator extends Mediator 
{

	@inject
	public var view : Console;
	
	override function onRegister() : Void
	{
		trace("ConsoleMediator.onRegister");
		view.inputBtn.addEventListener(MouseEvent.CLICK, handleInputText);
		addHandler(ConsoleDataMessages.MESSAGE_ADDED, handleMessageAdded);
		//addRemoteHandler(GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL_DONT_STORE, handleMessageAdded, ModuleNames.SHELL);
	}

	override function onRemove() : Void {
		trace("ConsoleMediator.onRemove");
	}

	function handleInputText(event : MouseEvent) : Void
	{
		var inputtext :String = "";
		
		#if flash
			inputtext = view.inputTf.text;
			trace("Console.handleTextInput > event : " + event + ".inputTf.text:"+inputtext);
		#elseif js
			inputtext = Reflect.field(view.inputTf, 'nmeGraphics').nmeSurface.innerHTML;
			trace("Console.handleTextInput > event : " + event + ".get_text	:"+ inputtext );
		#end
		
		if( inputtext != "" )  
		{
			sendMessage(ConsoleViewMessages.INPUT_MESSAGE, inputtext);
			
			#if flash
				view.inputTf.text = "";
			#elseif js
				Reflect.field(view.inputTf, 'nmeGraphics').nmeSurface.innerHTML = "";
			#end
		
		} else {
			sendMessage(ConsoleViewMessages.EMPTY_MESSAGE, "NO MESSAGE ENTERED!!.....");
		}
	}

	function handleMessageAdded(message : String) : Void {
		view.outputTf.text += message + "\n";
		view.outputTf.scrollV = view.outputTf.maxScrollV;
	}

}


/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modularsample.view;

import flash.events.Event;
import flash.events.MouseEvent;
import modularproject.global.components.PushButton;
import modularproject.global.ScopeNames;
import modularproject.global.messages.GlobalMessage;
import modularproject.modularsample.ModularSample;
import modularproject.modules.console.Console;
import modularproject.modules.console.view.ConsoleParams;
import mvcexpress.mvc.Mediator;

class ModularSampleMediator extends Mediator
{

	@inject
	public var view : ModularSample;
	
	var console1 : Console;
	var console2 : Console;
	var console3 : Console;
	var console4 : Console;
	var cosnole1Button : PushButton;
	var cosnole2Button : PushButton;
	var cosnole3Button : PushButton;
	var cosnole4Button : PushButton;
	
	override function onRegister() : Void 
	{
		trace("ModularSampleMediator.onRegister");
		new PushButton(view, 500, 370, "Test global message", handleMessageToAll);
		cosnole1Button = new PushButton(view, 20, 350, "Add console #1", handleAddConsole1);
		cosnole2Button = new PushButton(view, 150, 350, "Add console #2", handleAddConsole2);
		cosnole3Button = new PushButton(view, 20, 380, "Add console #3", handleAddConsole3);
		cosnole4Button = new PushButton(view, 150, 380, "Add console #4", handleAddConsole4);
		new PushButton(view, 500, 345, "message to #1", handleMessageToFirst).setSize(150, 22);
		new PushButton(view, 500, 370, "message to #2 and #4", handleMessageToEven).setSize(150, 22);
		new PushButton(view, 500, 395, "message to all", handleMessageToAll).setSize(150, 22);
		//new PushButton(view, 500, 425, "message to all no store", handleMessageToAllNoStore).width = 150;
		//new PushButton(view, 500, 525, "testing....", handleMessageToAllDublicate).width = 150;
	}

	override function onRemove() : Void {
		trace("ModularSampleMediator.onRemove");
	}

	function handleAddConsole1(event : Event) : Void {
		if(console1 != null)  {
			view.removeChild(console1);
			console1.disposeModule();
			console1 = null;
			cosnole1Button.label = "Add console #1";
		}

		else  {
			console1 = new Console(1);
			view.addChild(console1);
			cosnole1Button.label = "Remove console #1";
		}

	}

	function handleAddConsole2(event : Event) : Void {
		if(console2 != null)  {
			view.removeChild(console2);
			console2.disposeModule();
			console2 = null;
			cosnole2Button.label = "Add console #2";
		}

		else  {
			console2 = new Console(2);
			console2.x = 400;
			view.addChild(console2);
			cosnole2Button.label = "Remove console #2";
		}

	}

	function handleAddConsole3(event : Event) : Void {
		if(console3 != null)  {
			view.removeChild(console3);
			console3.disposeModule();
			console3 = null;
			cosnole3Button.label = "Add console #3";
		}

		else  {
			console3 = new Console(3);
			console3.y = 150;
			view.addChild(console3);
			cosnole3Button.label = "Remove console #3";
		}

	}

	function handleAddConsole4(event : Event) : Void 
	{
		if(console4 != null)  {
			view.removeChild(console4);
			console4.disposeModule();
			console4 = null;
			cosnole4Button.label = "Add console #4";
		} else  {
			console4 = new Console(4);
			console4.x = 400;
			console4.y = 150;
			view.addChild(console4);
			cosnole4Button.label = "Remove console #4";
		}

	}

	public function handleMessageToFirst(event : MouseEvent) : Void {
		sendScopeMessage(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, new ConsoleParams("Message to FIRST module!!!", [1]));
	}

	public function handleMessageToEven(event : MouseEvent) : Void {
		sendScopeMessage(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, new ConsoleParams("Message to even modules!!! (2 and 4)", [2, 4]));
	}

	public function handleMessageToAll(event : MouseEvent) : Void {
		sendScopeMessage(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, "Global message to all modules!!!");
	}

	//public function handleMessageToAllNoStore(event:MouseEvent):void {
	//sendMessageToAll(GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL_DONT_STORE, "Global message to all modules without using proxy!!!");
	//}
	//
	//public function handleMessageToAllDublicate(event:MouseEvent):void {
	//sendMessageToAll(ConsoleViewMsg.INPUT_MESSAGE, "Global message to all modules without using proxy!!!");
	//}
}



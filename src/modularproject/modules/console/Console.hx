/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import modularproject.global.components.PushButton;
import modularproject.global.messages.GlobalMessage;
import modularproject.global.ModuleNames;
import modularproject.global.ScopeNames;
import modularproject.modules.console.controller.HandleTargetedMessageCommand;
import modularproject.modules.console.controller.HandleInputCommand;
import modularproject.modules.console.msg.ConsoleDataMessages;
import modularproject.modules.console.msg.ConsoleMessages;
import modularproject.modules.console.msg.ConsoleViewMessages;
import modularproject.modules.console.model.ConsoleLogProxy;
import modularproject.modules.console.msg.ConsoleViewMessages;
import modularproject.modules.console.view.ConsoleMediator;
import mvcexpress.modules.ModuleSprite;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.MvcExpressTools;

class Console extends ModuleSprite
{

	public var consoleId 	: Int;
	public var outputTf 	: TextField;
	public var inputTf 		: TextField;
	public var inputBtn 	: PushButton;
	
	public function new(consoleId : Int = 0) 
	{
		this.consoleId = consoleId;
		super(ModuleNames.CONSOLE + this.consoleId);
	}
	
	override function onInit() : Void 
	{
		trace("Console.onInit");
		
		// for debugging
		#if debug
			MvcExpressTools.checkClassStringConstants([ConsoleMessages, ConsoleDataMessages, ConsoleViewMessages]);
		#end
		// set permision te receive messages to this scope. Commands use received messages to trigger.
		registerScope(ScopeNames.CONSOLE_SCOPE, false, true);

		// set up commands
		commandMap.map(ConsoleViewMessages.INPUT_MESSAGE, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);

		// set up view
		proxyMap.map(new ConsoleLogProxy(consoleId));
		mediatorMap.map(Console, ConsoleMediator);

		// start main view.
		renderConsoleView();
		mediatorMap.mediate(this);

	}
	
	public function renderConsoleView() : Void 
	{
		
		var txtFmt : TextFormat = new TextFormat();
			txtFmt.size = 9;
			txtFmt.font = "Verdana";
			
			
		// add message output
		outputTf = new TextField();
		outputTf.defaultTextFormat = txtFmt;
		outputTf.backgroundColor = 0xDEDEDE;
		outputTf.background = true;
		this.addChild(outputTf);
		outputTf.text = "Console #" + consoleId + " started.\n";
		
		outputTf.width = 300;
		outputTf.height = 100;
		outputTf.x = 5;
		outputTf.y = 5;

		// add message input

		inputTf = new TextField();
		inputTf.width = 245;
		inputTf.height = 22;
		inputTf.border = true;
		inputTf.defaultTextFormat = txtFmt;
		this.addChild(inputTf);
		inputTf.type = TextFieldType.INPUT;
//		inputTf.text = '';
		

		inputTf.x = 5;
		inputTf.y = outputTf.x + outputTf.height + 5;

		inputBtn = new PushButton(this, inputTf.x + inputTf.width + 5, inputTf.y + 2, "send");
		inputBtn.setSize(50, 20);

	}

	override function onDispose() : Void {
		trace("Console.onDispose");
	}
}


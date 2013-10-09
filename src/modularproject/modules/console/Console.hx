/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console;

import com.bit101.components.PushButton;
import com.bit101.components.TextArea;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;
import modularproject.global.ModuleNames;
import modularproject.modules.console.controller.setup.InitConsoleCommand;
import modularproject.modules.console.controller.setup.SetUpConsoleControllerCommand;
import modularproject.modules.console.controller.setup.SetUpConsoleModelCommand;
import modularproject.modules.console.controller.setup.SetUpConsolePermissionsCommand;
import modularproject.modules.console.controller.setup.SetUpConsoleViewCommand;
import modularproject.modules.console.msg.ConsoleDataMessages;
import modularproject.modules.console.msg.ConsoleMessages;
import modularproject.modules.console.msg.ConsoleViewMessages;
import mvcexpress.extensions.scoped.modules.ModuleScoped;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.CheckClassStringConstants;

class Console extends Sprite {

	public var module : ModuleScoped;
	public var consoleId : Int;
	public var outputTf : TextArea;
	public var inputTf : TextField;
	public var inputBtn : Sprite;
	public function new(consoleId : Int = 0) {
		this.consoleId = consoleId;
		module = new ModuleScoped(ModuleNames.CONSOLE + this.consoleId);
		trace("Console.onInit");
		// for debugging
		//CONFIG::debug {
		//checkClassStringConstants(ConsoleMessages, ConsoleDataMessages, ConsoleViewMessages);
		//	}
		renderConsoleView();
		module.executeCommand(SetUpConsolePermissionsCommand);
		module.executeCommand(SetUpConsoleControllerCommand);
		module.executeCommand(SetUpConsoleModelCommand, this.consoleId);
		module.executeCommand(SetUpConsoleViewCommand);
		module.executeCommand(InitConsoleCommand, this);
	}

	public function renderConsoleView() : Void {
		// add message output
		outputTf = new TextArea();
		this.addChild(outputTf);
		outputTf.text = "Console #" + consoleId + " started.
";
		outputTf.width = 300;
		outputTf.height = 100;
		outputTf.x = 5;
		outputTf.y = 5;
		// add message input
		inputTf = new TextField();
		this.addChild(inputTf);
		inputTf.text = "";
		inputTf.border = true;
		inputTf.type = TextFieldType.INPUT;
		inputTf.width = 300;
		inputTf.height = 22;
		inputTf.x = 5;
		inputTf.y = outputTf.x + outputTf.height + 5;
		inputBtn = new PushButton(this, inputTf.x + inputTf.width + 5, inputTf.y + 2, "send");
		inputBtn.width = 50;
	}

	public function dispose() : Void {
		module.disposeModule();
	}

}


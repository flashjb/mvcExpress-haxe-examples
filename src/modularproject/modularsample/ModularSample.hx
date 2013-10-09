//import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modularsample;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import modularproject.global.ModuleNames;
import modularproject.modularsample.controller.setup.InitModularSampleCommand;
import modularproject.modularsample.controller.setup.SetUpPermissionsCommand;
import modularproject.modularsample.controller.setup.SetUpViewCommand;
import modularproject.modularsample.msg.DataMessages;
import modularproject.modularsample.msg.Messages;
import modularproject.modularsample.msg.ViewMessages;
import mvcexpress.extensions.scoped.modules.ModuleScoped;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.CheckClassStringConstants;

class ModularSample extends Sprite {

	public var module : ModuleScoped;
	public function new() {
		module = new ModuleScoped(ModuleNames.SHELL);
		//CONFIG::debug {
		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
		//MvcExpressLogger.init(this.stage);
		//checkClassStringConstants(Messages, DataMessages, ViewMessages);
		//}
		//
		this.stage.align = StageAlign.TOP_LEFT;
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		trace("ModularSampleShellModule.onInit");
		module.executeCommand(SetUpPermissionsCommand);
		module.executeCommand(SetUpViewCommand);
		module.executeCommand(InitModularSampleCommand, this);
	}

}


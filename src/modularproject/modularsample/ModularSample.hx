//import modularproject.mvcExpressLogger.MvcExpressLogger;
/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modularsample;

import mvcexpress.modules.ModuleSprite;
import modularproject.global.ModuleNames;
import modularproject.global.ScopeNames;
import modularproject.modularsample.msg.DataMessages;
import modularproject.modularsample.msg.Messages;
import modularproject.modularsample.msg.ViewMessages;
import modularproject.modularsample.view.ModularSampleMediator;
import mvcexpress.utils.MvcExpressTools;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

class ModularSample extends ModuleSprite 
{

	public function new() 
	{
		super(ModuleNames.SHELL);
		
		#if debug
		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
			//MvcExpressLogger.init(this.stage);
			MvcExpressTools.checkClassStringConstants([Messages, DataMessages, ViewMessages]);
		#end
		//
		if( stage != null )
		{
			_stageInit();
		}else{
			addEventListener(Event.ADDED_TO_STAGE, _stageInit);
		}
	}
	function _stageInit( e: Event = null ):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, _stageInit);
		this.stage.align = StageAlign.TOP_LEFT;
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
	
	override function onInit():Void
	{
		trace("ModularSampleShellModule.onInit");

		// set permision te send messages to this scope.
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);

		mediatorMap.map(ModularSample, ModularSampleMediator);

		mediatorMap.mediate(this);

	}

	static public function main() 
	{
		flash.Lib.current.addChild(new ModularSample());
	}
}


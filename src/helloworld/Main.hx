//import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
/**
 * Main application class.
 */
package helloworld;

import flash.display.Sprite;
import flash.events.Event;

//@:meta(Frame(factoryClass="helloWorld.Preloader"))
class Main extends Sprite 
{
	var module : MainModule;
	
	public function new() 
	{
		super();
		if(stage != null)  
		{
			init();
		} else  {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	function init(event : Event = null) : Void 
	{
		trace("Main.init > event : " + event);
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		// entry point
		module = new MainModule();
		module.start(this);
	}
	
	static public function main() 
	{
		flash.Lib.current.addChild(new Main());
	}
}


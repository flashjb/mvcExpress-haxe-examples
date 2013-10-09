/**
 * Application preloader.
 */
package helloworld;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.utils.GetDefinitionByName;

class Preloader extends MovieClip {

	public function new() {
		if(stage)  {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		addEventListener(Event.ENTER_FRAME, checkFrame);
		loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
		loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
		// TODO show loader
	}

	function ioError(e : IOErrorEvent) : Void {
		trace(e.text);
	}

	function progress(e : ProgressEvent) : Void {
		// TODO update loader
	}

	function checkFrame(e : Event) : Void {
		if(currentFrame == totalFrames)  {
			stop();
			loadingFinished();
		}
	}

	function loadingFinished() : Void {
		removeEventListener(Event.ENTER_FRAME, checkFrame);
		loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
		loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
		// TODO hide loader
		startup();
	}

	function startup() : Void {
		var mainClass : Class<Dynamic> = Type.getClass(getDefinitionByName("helloWorld.Main"));
		addChild(try cast(new MainClass(), DisplayObject) catch(e) null);
	}

}


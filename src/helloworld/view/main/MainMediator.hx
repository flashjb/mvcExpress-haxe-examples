/**
 * Mediator for aplication root view object.
 */
package helloworld.view.main;

import flash.events.MouseEvent;
import helloworld.Main;
import helloworld.messages.DataMsg;
import helloworld.messages.ViewMsg;
import helloworld.model.TestProxy;
import mvcexpress.mvc.Mediator;

class MainMediator extends Mediator {

	// view object mediator is mediator is injected by object class.
	// it can be named as you like, but "view" is commonly used.
	@inject
	public var view : Main;
	// In many cases you will need to get your proxies using injection to work with your data.
	// Proxy must be mapped first to be injected.
	@inject
	public var testProxy : TestProxy;

	override function onRegister() : Void {
		trace("MainMediator.onRegister", "view:" + view);
		// to handle user ineraction you will want to listen for view events, and handle them.
		view.stage.addEventListener(MouseEvent.CLICK, handleStageClick);
		// to handle framework messages you will add message handler.
		addHandler(DataMsg.TEST_DATA_CHANGED, handleTestDataChange);
	}

	function handleStageClick(event : MouseEvent) : Void {
		trace("MainMediator.handleMainClick > event : " + event);
		// in many cases you will want to send a message then user makes input.
		sendMessage(ViewMsg.MAIN_CLICKED);
	}

	function handleTestDataChange(testData : String) : Void {
		trace("MainMediator.handleTestDataChange > testData : " + testData);
		// then handling messages you will have 2 options from there you get your data.
		// 1 - handler function parameter. (for this examle )
		// 2 - use testProxy to get your data.
		// you can use any option, and both can be better suited for diferent situation.
		// if you use #2 - you will make view-data coupling.
		// If your view depends on some proxies. (cant be separated) then using #2 option is good idea!
	}

	override function onRemove() : Void {
		// called then view us unmaped.
		// you will want to remove all your event listeners here.
		view.stage.removeEventListener(MouseEvent.CLICK, handleStageClick);
		// you don't need to remove framework message handlers. They are removed automaticaly.
	}

}


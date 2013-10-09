/**
 * Test proxy.
 */
package helloworld.model;

import helloworld.messages.DataMsg;
import mvcexpress.mvc.Proxy;

class TestProxy extends Proxy {

	// test data...
	var testData : String;
	
	public function new() 
	{
		super();
		testData = "testData";
	}

	//----------------------------------
	//     your functions to handle your data.
	//----------------------------------
	public function getTestData() : String {
		return testData;
	}

	public function setTestData(value : String) : Void {
		testData = value;
		// in many cases then dada is chaned, you want to send a message so any interested mediators or commands colud react.
		sendMessage(DataMsg.TEST_DATA_CHANGED, testData);
	}

	//----------------------------------
	//     onRegister() function is tregered then proxy is registered with framework.
	//        you will want to use it instead of constructor then you have other proxies injected.
	//
	//     onRemove() is to dispose proxy then it is unregistered from framework.
	//
	//    these functions are raraly used.
	//----------------------------------
	override function onRegister() : Void {
		trace("TestProxy.onRegister");
	}

	override function onRemove() : Void {
	}

}


/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
package modularproject.modules.console.view;

class ConsoleParams {

	public var text : String;
	public var targetConsoleIds : Array<Dynamic>;
	public function new(text : String, targetConsoleIds : Array<Dynamic>) {
		this.text = text;
		this.targetConsoleIds = targetConsoleIds;
	}

}


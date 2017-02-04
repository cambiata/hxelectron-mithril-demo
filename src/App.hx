package;


/**
 * ...
 * @author Jonas Nyström
 */

import js.Browser.console;
import js.Browser.document;
import js.Browser.window;
import js.Node.process;
import mithril.M;

class App {

    static function main() {
        window.onload = function(){
            var electronInfo = 'hxelectron - ' + process.version + ' - ' + process.versions['electron'];
            console.info( electronInfo );
			var appState:AppState = { electronInfo: electronInfo, text:'Hello world! from Mithril Electron' };
			
			var index = new Index(appState);	
			haxe.Timer.delay( function() {
				// Short delay to see when mithril kicks in...
				M.mount(document.body, index);
			}, 2000);			
        }
    }
}

typedef AppState = {text:String, electronInfo:String};

class Index implements Mithril  {
	
	public var appState:AppState;
	public function new(appState:AppState) {
		this.appState = appState;	
	}	
	
	public function view() [
		m('p', 'AppState: ' + this.appState),
		m("input", { oninput:  function(e) this.appState.text = e.target.value, value: this.appState.text } ),
		m('p',  this.appState.text),
	];
	
	
}

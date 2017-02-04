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
            var info = 'hxelectron - '+process.version+' - '+process.versions['electron'];
            console.info( info );
	var appState:AppState = { info: info, text:'Mithril Electron' };
	
	var index = new Index(appState);	
	haxe.Timer.delay( function() {
		mithril.M.mount(js.Browser.document.body, index);
	}, 1000);			
        }
    }
}

typedef AppState = {text:String, info:String};

class Index implements Mithril  {
	
	public var appState:AppState;
	public function new(appState:AppState) {
		this.appState = appState;	
	}	
	
	public function view() [
		m('p', 'Hello world:' + this.appState),
		m("input", { oninput:  function(e) this.appState.text = e.target.value, value: this.appState.text } ),
		m('p',  this.appState.text),
	];
	
	
}

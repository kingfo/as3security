package security {
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import mx.events.Request;
	import utils.uri.getParentPath;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class CrossDomainApplication {
		
		public static const DEFAULT_FILE_NAME:String = "whitelist";
		
		public function CrossDomainApplication(policyFileName:String = null) {
			this.policyFileName = policyFileName || DEFAULT_FILE_NAME;
		}
		
		public function applyTo(secureObject:Object,
								hostInfo:LoaderInfo,
								requestDomain:String,
								callback:Function = null):void {
			dump.push( {
				secureObject:secureObject,
				hostInfo:hostInfo,
				requestDomain:requestDomain,
				callback:callback
				});
			loadPolicyFile(loaderInfo);
		}
		
		private function loadPolicyFile(loaderInfo:LoaderInfo):void {
			if (policyFile) {
				exec();
				return;
			}
			swfPath = loaderInfo.url;
			swfParentPath = getParentPath(swfPath);
			
			policyPath = swfParentPath + policyFile;
			
			var ldr:URLLoader = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, onComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, onError);
			ldr.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			
			ldr.load(new Request(policyPath));
		}
		
		private function onComplete(e:Event):void {
			try {
				parse(new XML(e.target.data));
			}catch (e:Error) {
				
			}
		}
		
		private function parse(xml:XML):void {
			
		}
		
		private function onError(e:Event):void {
			//applyCallback(false,e.type)
		}
		
		
		
		private var dump:Array = [];
		private var policyFileName:String;
		private var policyPath:String;
		private var policyFile:XML;
		private var swfPath:String;
		private var swfParentPath:String;
		
	}

}
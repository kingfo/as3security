package security {
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import utils.location.getLocation;
	import utils.string.trim;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class CrossDomainWhitelist {
		
		public static const DEFAULT_FILE_NAME:String = "whitelist";
		
		
		public function CrossDomainWhitelist(policyFileName:String = null) {
			policyFile = (policyFileName || DEFAULT_FILE_NAME) + '.xml';
		}
		
		public function check(loaderInfo:LoaderInfo,callback:Function):void {
			this.callback = callback;
			
			swfURL = clearTrailingSlash(loaderInfo.loaderURL);
			swfParentPath = getParentPath(swfURL);
			
			pageURL = clearTrailingSlash(getLocation().href);
			pageParentPath = getParentPath(pageURL);
			pageDomain = getDomain(pageURL);
			
			if (pageParentPath.indexOf(swfParentPath) === 0) { // 仅允许 page 是 swf 文件存放的 目录 或 子目录
				applyCallback(true,'sameOrigin');
				return;
			}
			loadPolicyFile(swfParentPath);
			
		}
		
		
		
		private function clearTrailingSlash(url:String):String {
			return ( url.charAt(url.length - 1) == '/') ? url.slice(0, -1) : url;
		}
		private function getParentPath(url:String):String {
			return url.slice(0, url.lastIndexOf('/')) + '/';
		}
		private function getDomain(url:String):String {
			return url.split("://")[1].split("/")[0];
		}
		
		
		private function loadPolicyFile(path:String):void {
			var url:String = path + policyFile;
			var req:URLRequest = new URLRequest(url);
			var ldr:URLLoader = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, onComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, onError);
			ldr.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			
			ldr.load(req);
		}
		
		private function onComplete(e:Event):void {
			parse(new XML(e.target.data));
		}
		
		private function parse(xml:XML):void {
			var approvedDomains: Array = [];
			var d:String;
			for each(var path:XML in xml['allow-access-from']) {
				d = trim(path.@domain);
				approvedDomains.push(d); //e.g. ["*.github.com" , "www.xintend.com", "app.xintend.com"]
			}
			if (approvedDomains.indexOf("*", 0) > -1) {
				applyCallback(true, 'insecurePolicy');
				return;
			}
			if (approvedDomains.length < 1) applyCallback(false, "unspecifiedDomain");
			var allowedDomainsString:String = approvedDomains.join("|"); //e.g. "*.github.com|www.xintend.com|app.xintend.com"
			allowedDomainsString = allowedDomainsString.replace(/\./g, "\\.").replace("\*", "\.*");
			var allowedPattern:String = "(^" + allowedDomainsString + "/?)";
			var domainCheck:RegExp = new RegExp(allowedPattern, "i");
			var domainCheckResult:* = domainCheck.exec(pageDomain);
			/*trace("approvedDomains:" + approvedDomains,
					"allowedDomainsString:" + allowedDomainsString,
					"allowedPattern:" + allowedPattern,
					"domainCheckResult:" + domainCheckResult);*/
			if (domainCheckResult == null) {
				applyCallback(false,'untrustedDomain');
			}else {
				applyCallback(true,'trustedDomain');
			}
		}
		
		
		private function onError(e:Event):void {
			applyCallback(false,e.type)
		}
		
		
		private function applyCallback(t:Boolean, msg:String):void {
			callback({ 	isAllowed:t,
						swfURL:swfURL,
						swfParentPath:swfParentPath,
						pageURL:pageURL,
						pageParentPath:pageParentPath,
						pageDomain:pageDomain,
						policyFile:policyFile,
						message:msg
						});
		}
		
		private var policyFile:String;
		private var callback:Function;
		private var ready:Boolean = false;
		private var swfURL:String;
		private var swfParentPath:String;
		private var pageURL:String;
		private var pageParentPath:String;
		private var pageDomain:String;
		
	}

}
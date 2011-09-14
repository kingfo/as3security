package security {
	import asunit.framework.TestCase;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class CrossDomainWhitelistTC  extends TestCase {
		
		public function CrossDomainWhitelistTC(testMethod:String = null) {
			super(testMethod);
		}
		
		public function testCheck():void {
			var wl:CrossDomainWhitelist = new CrossDomainWhitelist();
			wl.check(Hack.stage.loaderInfo, function(data:Object):void {
					trace("testCheck: " + data.message);
					switch(data.message) {
						case 'insecurePolicy':
						case 'trustedDomain':
						case 'sameOrigin':
							assertTrue(data.isAllowed);
							break;
						case 'untrustedDomain':
						case 'unspecifiedDomain':
							assertFalse(data.isAllowed);
						default:
							assertFalse(data.isAllowed);
					}
				} );
		}
		
		public function testCheckViaSpecifiedFile():void {
			var wl:CrossDomainWhitelist = new CrossDomainWhitelist('otherwhitelist');
			wl.check(Hack.stage.loaderInfo, function(data:Object):void {
					trace("testCheckViaSpecifiedFile: " + data.message);
					switch(data.message) {
						case 'insecurePolicy':
						case 'trustedDomain':
						case 'sameOrigin':
							assertTrue(data.isAllowed);
							break;
						case 'untrustedDomain':
						case 'unspecifiedDomain':
							assertFalse(data.isAllowed);
						default:
							assertFalse(data.isAllowed);
					}
				} );
		}
		
	}

}
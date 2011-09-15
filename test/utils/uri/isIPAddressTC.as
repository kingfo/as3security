package utils.uri {
	import asunit.framework.TestCase;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class isIPAddressTC extends TestCase {
		
		public function isIPAddressTC(m:String=null) {
			super(m);
		}
		
		public function testAll():void {
			assertTrue(isIPAddress("255.255.255.255"));
			assertTrue(isIPAddress("127.0.0.1"));
			assertTrue(isIPAddress("0.0.0.0"));
			
			assertFalse(isIPAddress("255.255.255.256"));
			assertFalse(isIPAddress("001.255.255.001"));
			assertFalse(isIPAddress("300.255.255.001"));
			
		}
	}

}
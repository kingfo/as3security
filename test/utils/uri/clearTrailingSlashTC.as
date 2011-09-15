package utils.uri {
	import asunit.framework.TestCase;
	
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class clearTrailingSlashTC extends TestCase {
		
		public function clearTrailingSlashTC(testMethod:String=null) {
			super(testMethod);
		}
		
		public function testAll():void {
			var url:String = "http://deep.subdomain.example.com.cn:8080/absolute/URI/with/absolute/path/to";
			assertEquals(url, clearTrailingSlash(url));
			assertEquals(url, clearTrailingSlash(url+"///////////"));
		}
	}

}
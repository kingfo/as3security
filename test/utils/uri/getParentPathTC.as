package utils.uri {
	import asunit.framework.TestCase;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class getParentPathTC extends TestCase {
		
		public function getParentPathTC(m:String = null) {
			super(m);
		}
		
		public function testAll():void {
			var url:String = 'http://deep.subdomain.example.org:8080/absolute/URI/with/absolute/path/to/resource.html?id=9999q=uri#abc';
			assertEquals('http://deep.subdomain.example.org:8080/absolute/URI/with/absolute/path/to/',getParentPath(url));
		}
		
	}

}
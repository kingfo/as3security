package utils.uri {
	import asunit.framework.TestCase;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class parseURITC extends TestCase {
		
		public function parseURITC(testMethod:String = null) {
			super(testMethod);
		}
		
		public function testHTTP():void {
			var url:String = 'http://deep.subdomain.example.org:8080/absolute/URI/with/absolute/path/to/resource.html?id=9999q=uri#abc';
			var res:* = parseURI(url);
			assertEquals(url,res.source);
			assertEquals('http://deep.subdomain.example.org:8080',res.origin);
			assertEquals('http',res.protocol);
			assertEquals('deep.subdomain.example.org',res.host);
			assertEquals('deep.subdomain',res.subdomain);
			assertEquals('example.org',res.domain);
			assertEquals('org',res.extension);
			assertEquals('8080',res.port);
			assertEquals('/absolute/URI/with/absolute/path/to/resource.html',res.path);
			assertEquals('/absolute/URI/with/absolute/path/to/', res.directoryPath);
			assertEquals('resource.html',res.file);
			assertEquals('id=9999q=uri',res.query);
			assertEquals('abc', res.anchor);
		}
		
		public function testHTTP2():void {
			var url:String = 'http://deep.subdomain.example.com.cn:8080/absolute/URI/with/absolute/path/to/resource.html?id=9999q=uri#abc';
			var res:* = parseURI(url);
			assertEquals(url, res.source);
			assertEquals('http://deep.subdomain.example.com.cn:8080',res.origin);
			assertEquals('http',res.protocol);
			assertEquals('deep.subdomain.example.com.cn',res.host);
			assertEquals('deep.subdomain.example',res.subdomain);
			assertEquals('com.cn',res.domain);
			assertEquals('cn',res.extension);
			assertEquals('8080',res.port);
			assertEquals('/absolute/URI/with/absolute/path/to/resource.html',res.path);
			assertEquals('resource.html',res.file);
			assertEquals('id=9999q=uri',res.query);
			assertEquals('abc', res.anchor);
		}
		
		public function testHTTPWithIP():void {
			var url:String = 'http://127.0.0.1:8080/absolute/URI/with/absolute/path/to/resource.html?id=9999q=uri#abc';
			var res:* = parseURI(url);
			assertEquals(url, res.source);
			assertEquals('http://127.0.0.1:8080', res.origin);
			assertEquals('http',res.protocol);
			assertEquals('127.0.0.1', res.host);
			//assertEquals('',res.subdomain);
			//assertEquals('',res.domain);
			//assertEquals('',res.extension);
			assertEquals('8080',res.port);
			assertEquals('/absolute/URI/with/absolute/path/to/resource.html',res.path);
			assertEquals('/absolute/URI/with/absolute/path/to/',res.directoryPath);
			assertEquals('resource.html',res.file);
			assertEquals('id=9999q=uri',res.query);
			assertEquals('abc', res.anchor);
		}
		
		public function testFTP():void {
			var url:String = 'ftp://login:password@deep.subdomain.example.org:60050';
			var res:* = parseURI(url);
			assertEquals(url, res.source);
			assertEquals('ftp://login:password@deep.subdomain.example.org:60050',res.origin);
			assertEquals('ftp',res.protocol);
			assertEquals('login',res.login);
			assertEquals('password',res.pass);
			assertEquals('deep.subdomain.example.org',res.host);
			assertEquals('deep.subdomain',res.subdomain);
			assertEquals('example.org',res.domain);
			assertEquals('org',res.extension);
			assertEquals('60050',res.port);
			assertEquals('',res.path);
			assertEquals('',res.directoryPath);
			assertEquals('',res.file);
			assertEquals('',res.query);
			assertEquals('', res.anchor);
		}
		
		public function testFTPWithIP():void {
			var url:String = 'ftp://login:password@127.0.0.1:60050';
			var res:* = parseURI(url);
			assertEquals(url,res.source);
			assertEquals('ftp',res.protocol);
			assertEquals('login',res.login);
			assertEquals('password',res.pass);
			assertEquals('127.0.0.1',res.host);
			//assertEquals('',res.subdomain);
			//assertEquals('',res.domain);
			//assertEquals('',res.extension);
			assertEquals('60050',res.port);
			assertEquals('',res.path);
			assertEquals('',res.file);
			assertEquals('',res.query);
			assertEquals('', res.anchor);
		}
		
	}

}
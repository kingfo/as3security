package  {
	import asunit.framework.TestSuite;
	import security.CrossDomainWhitelistTC;
	import utils.uri.clearTrailingSlashTC;
	import utils.uri.getParentPathTC;
	import utils.uri.isIPAddressTC;
	import utils.uri.parseURITC;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class AllTests extends TestSuite {
		
		public function AllTests() {
			super();
			
			/* security */
			addTest(new CrossDomainWhitelistTC());
			
			/* utils */
			addTest(new parseURITC());
			addTest(new isIPAddressTC());
			addTest(new clearTrailingSlashTC());
			addTest(new getParentPathTC());
		}
		
	}

}
package  {
	import asunit.framework.TestSuite;
	import security.CrossDomainWhitelistTC;
	/**
	 * ...
	 * @author Kingfo[Telds longzang]
	 */
	public class AllTests extends TestSuite {
		
		public function AllTests() {
			super();
			
			
			addTest(new CrossDomainWhitelistTC());
		}
		
	}

}
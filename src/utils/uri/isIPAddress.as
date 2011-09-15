package utils.uri {
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
		
	public function isIPAddress(uri:String):Boolean {
		var regExp:RegExp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
		return regExp.test(uri);
	}
		

}
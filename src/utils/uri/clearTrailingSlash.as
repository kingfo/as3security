package utils.uri {
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
		
	public function clearTrailingSlash(url:String):String {
		var str:String = url;
		while (str.charAt(str.length - 1) == '/') {
			str = str.slice(0, -1);
		}
		return str;
	}

}
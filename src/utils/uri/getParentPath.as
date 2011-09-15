package utils.uri {
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	
	public function getParentPath(url:String):String {
		var o:* = parseURI(url);
		return o.origin + o.directoryPath;
	}

}
package utils.uri {
	/**
	 * Actionscript3 only
	 * 
	 * @param uri				Uniform Resource Identifier
	 * @return
	 * .source
	 * .origin			includes protocol,login,pass,host and port
	 * .protocol 		scheme
	 * .login			
	 * .pass
	 * .host			
	 * .subdomain		part of the host	
	 * .domain			part of the host
	 * .extension		domian extension, part of the domain 
	 * .port
	 * .path			includes both the directory path and file
	 * .directoryPath	part of the path; supports directories with periods, and without a trailing backslash
	 * .file			part of the path
	 * .query			does not include the leading question mark
	 * .anchor			fragment
	 * @author KingFo (telds kingfo)
	 */
	public function parseURI(uri:String):*{
		var regExp:RegExp = /^(?P<origin>(?:(?P<protocol>\w+):\/\/)?(?:(?P<login>\w+):(?P<pass>\w+)@)?(?P<host>(?:(?P<subdomain>[\w\.]+)\.)?(?P<domain>\w+\.(?P<extension>\w+)))(?::(?P<port>\d+))?)(?P<path>(?P<directoryPath>[\w\/%]*\/)(?P<file>\w+(?:\.\w+)?)?)?(?:\?(?P<query>[\w=&]+))?(?:#(?P<anchor>\w+))?/g;
		var res:* = regExp.exec(uri);
		res.source = uri
		if (res.directoryPath.length > 0){
			res.directoryPath = res.directoryPath.replace(/\/?$/, "/");
		}
		return res;
	}

}
package utils.location {
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	
	public function getLocation():*{
		var location:*;
		var code:XML = <code>
							<![CDATA[
							function () {
								return document.location;
							}
							]]>
						</code>;
		if (ExternalInterface.available) {
			location = ExternalInterface.call(code);
		}else {
			throw new Error("Request failed. External interface is not available for this container. If you're trying to use it locally, try using it through an HTTP address.");
		}
		return location;
	}

}
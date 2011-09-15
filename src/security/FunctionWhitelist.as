package security {
	import asunit.util.ArrayIterator;
	/**
	 * ...
	 * @author KingFo (telds kingfo)
	 */
	public class FunctionWhitelist {
		
		public function FunctionWhitelist() {
			
		}
		
		public function check(host:*,methodName:String,callback:Function,approvedMethods:Array = null):void {
			if (!host) return;
			this.approvedMethods = approvedMethods || this.approvedMethods; 
			if (!this.approvedMethods || approvedMethods.length < 1) throw new Error("approvedMethods unspecified ");
			var data:Object = {
								host:host,
								methodName:methodName,
								method:null,
								message:'',
								isAllowed:false
								};
			
			if (!(methodName in approvedMethods)) {
				applyCallback(callback,null,false,method,host, 'method not allowed');
				return;
			}
			var nest:Array;
			var m:* = host;
			var i:int;
			nest = method.split(".");
			for (i = 0; i < nest.length; i++) {
                m = m[nest[i]];
                if (!m) {
                    applyCallback(callback,null,false,method, 'method not found');
                }
            }
			applyCallback(callback,fn,m);
		}
		
		
		private var approvedMethods:Array;
	}

}
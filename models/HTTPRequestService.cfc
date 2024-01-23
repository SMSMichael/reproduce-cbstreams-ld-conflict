/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	HTTPRequestService function init(){

		return this;
	}

	/**
	 * I perform an HTTP call to an endpoint to get some data
	 */
	public struct function performSampleHTTPCall() {
		var httpRequest = new http(
			method = "GET",
			url = "http://#CGI.http_host#/main/data"
		);
		sleep( rand() * 2000); // create some artificial lag
		return httpRequest.send().getPrefix();
	}


}
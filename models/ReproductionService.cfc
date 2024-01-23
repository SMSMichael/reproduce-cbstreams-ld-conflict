/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties

	/**
	 * Constructor
	 */
	ReproductionService function init(){

		return this;
	}

	/**
	 * I perform a basic parallel stream example
	 */
	public array function parallelStreamExample() {
		var results = new modules.cbstreams.models.Stream( [
			"one",
			"two",
			"three",
			"four",
			"six",
			"seven",
			"eight",
			"nine"
		] ).parallel()
			.filter( function( item ){
				try {
					// out.println( "**** Filter (#arguments.item#) Thread Name: #createObject( "java", "java.lang.Thread" ).currentThread().getName()#" );
					// out.println( "mappings: " & getApplicationMetadata().mappings.keyList() );
					// out.println( "url: " & url.count() & " -- form: " & form.keyList() & " -- request: " & request.keyList() & " -- headers: "  & getHTTPRequestData().headers.count() & " -- cgi: " & cgi.script_name );
					return arguments.item.len() > 3;
				} catch ( any e ) {
					out.println( e.message );
					out.println( e.detail );
					rethrow;
				}
			} )
			.map( function( item ){
				// out.println( "**** Map (#arguments.item#) Thread Name: #createObject( "java", "java.lang.Thread" ).currentThread().getName()#" );
				return uCase( arguments.item );
			} )
			.collect();

			return results;
	}

	/**
	 * I perform a basic parallel stream example
	 */
	public array function parallelStreamWithHTTPExample() {
		var results = new modules.cbstreams.models.Stream( [
			"1",
			"2",
			"3",
			"4"
		] ).parallel()
			.map( function( item ){
				var httpService = new models.HTTPRequestService();
				var results = deserializeJSON(httpService.performSampleHTTPCall().fileContent);
				return {"item": item, "payload": results[item]};
				// out.println( "**** Map (#arguments.item#) Thread Name: #createObject( "java", "java.lang.Thread" ).currentThread().getName()#" );
			} )
			.collect();

			return results;
	}


}
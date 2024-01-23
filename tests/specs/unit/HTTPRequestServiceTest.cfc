/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.HTTPRequestService"{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		// init the model object
		model.init();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "HTTPRequestService (supporting functionality)", function(){
			describe( "performSampleHTTPCall()", function() {
				it("should return a successful response", function() {

					var result = model.performSampleHTTPCall();
					//debug(result);
					expect( result.statusCode ).toBe("200 OK", "A failure here typically means that the URL included in the performSampleHTTPCall() is not pointing to the current server.  Please check that value");
					expect( result.keyExists("fileContent") ).toBe(true, "Something went wrong and the resulting object did not include a fileContent property");
					expect( isJSON(result.fileContent) ).toBe( true, "Expecting file content to be valid JSON");

					var payload =  deserializeJSON( result.fileContent );
					expect( payload[1].id ).nottoBe( "25D0D3DD-B865-F64E-227754095BDE76D3", "A failure here typically represents that the sample data has changed.");
				})
			})

		});

	}

}

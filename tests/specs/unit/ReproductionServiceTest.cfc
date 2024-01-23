/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.ReproductionService"{

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

		describe( "ReproductionService (I do the work for this example)", function(){

			describe("parallelStreamExample()", function() {
				it("should successfully process a parallel request", function() {
					var results = model.parallelStreamExample();

					expect( results ).toHaveLength( 5 );
				})
			})

			describe("parallelStreamWithHTTPExample()", function() {
				it("should successfully process parallel HTTP requests", function() {
					var results = model.parallelStreamWithHTTPExample();
					debug(results);

					expect( false ).toBe( true, "not implemented");

				})
			});

		});

	}

}

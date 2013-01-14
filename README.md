# RfBusterAssertions - Additional assertions for Buster.js
This is a small collection of additional asssertions for Buster.js. 
The assertions themselves is most likely out of the scope of the original 
project, but assertions I still feel is useful.

## Installation
Copy the git repository to your testing directory or where you feel appropriate. 
Then add an reference in you test configuration file (most likely named buster.js) 
to the library in the section testHelpers. 

For example like this:

	config = module.exports;
	
	config["My tests"] = {
	  environment: "browser",
	  
	  testHelpers: [
	    'RfBusterAssertions/lib/*.js'
	  ],
	  
	  resources: [
	  ],
	  
	  sources: [
	    "project-under-test/*.js"
	  ],
	  
	  tests: [
	    "test/*-test.js"
	  ]
	};

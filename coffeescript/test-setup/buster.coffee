config = module.exports

config["My tests"] =
  rootPath: "../"
  environment: "browser" # or "node"
  
  testHelpers: [
    'lib/*.js'
  ]
  
  resources: [
  ]
  
  sources: [
  ]
  
  tests: [
    "test/*-test.js"
  ]
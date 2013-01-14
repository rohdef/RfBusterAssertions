buster.testCase "ConnectivityMap with maps loaded", {
  setUp: () ->
    this.server = this.useFakeServer()
    this.url = 'dummy.js'
    this.urlWithGet = this.url + "?random=get&parameters=work"
    
    scripts = document.getElementsByTagName 'script'
    for script in scripts
      script.parentElement.removeChild(script)
  
  "URL is registered on XHR": () ->
    request = new XMLHttpRequest()
    request.open 'GET', this.url, false
    request.send()
    
    assert.urlRequest(this.server, "dummy.js")
    expect(this.server).toHaveRequestedTheUrl("dummy.js")
    
  "URL is registered when adding a script element to head": () ->
    script = document.createElement "script"
    script.type = "text/javascript"
    script.src = this.url

    document.head.appendChild script
    
    assert.urlRequest(this.server, "dummy.js")
    expect(this.server).toHaveRequestedTheUrl("dummy.js")
    
  "URL is registered when adding a script element to body": () ->
    script = document.createElement "script"
    script.type = "text/javascript"
    script.src = this.url

    document.body.appendChild script
    
    assert.urlRequest(this.server, "dummy.js")
    expect(this.server).toHaveRequestedTheUrl("dummy.js")
  
  "URL registered ignores get parameters": () ->
    request = new XMLHttpRequest()
    request.open 'GET', this.urlWithGet, false
    request.send()
    
    assert.urlRequest(this.server, "dummy.js")
    expect(this.server).toHaveRequestedTheUrl("dummy.js")
  
  "Get params can be tested": () ->
    # How to test this I wonder, pass an object to the test down under
    # Return the params to inspect, if a request doesn't match should I reject
    # All or none how should this be done
}
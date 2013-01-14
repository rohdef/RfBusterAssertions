buster.testCase "ConnectivityMap with maps loaded", {
  setUp: () ->
    this.server = this.useFakeServer()
    this.url = 'dummy.js'
    
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
}
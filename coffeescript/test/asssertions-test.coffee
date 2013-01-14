buster.testCase "ConnectivityMap with maps loaded", {
  setUp: () ->
    this.url = 'dummy.js'
  
  "URL is registered on XHR": () ->
    request = new XMLHttpRequest()
    request.open 'GET', this.url, false
    request.send()
    
    assert.urlLoaded("dummy.js")
    expect("dummy.js").toBeAnLoadedUrl()
    
  "URL is registered when adding a script element to head": () ->
    script = document.createElement "script"
    script.type = "text/javascript"
    script.src = this.url

    document.head.appendChild script
    
    assert.urlLoaded("dummy.js")
    expect("dummy.js").toBeAnLoadedUrl()
    
  "URL is registered when adding a script element to body": () ->
    script = document.createElement "script"
    script.type = "text/javascript"
    script.src = this.url

    document.body.appendChild script
    
    assert.urlLoaded("dummy.js")
    expect("dummy.js").toBeAnLoadedUrl()
    
}
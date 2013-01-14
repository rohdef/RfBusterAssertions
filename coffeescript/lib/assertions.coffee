window.String.prototype.endsWith = (suffix) ->
  return this.indexOf(suffix, this.length - suffix.length) != -1

buster.assertions.add "urlRequest", {
  assert: (server, url) ->
    scripts = document.getElementsByTagName 'script'
      
    for request in server.requests
      foundUrl = request.url
      
      # Some browsers will prepend stuff to local urls
      if foundUrl.endsWith(url) then return true

    for script in scripts
      foundUrl = script.src
      
      # Some browsers will prepend stuff to local urls
      if foundUrl.endsWith(url) then return true
    
    return false
  
  values: (server, url, message) ->
    if (!message?) then message = ''
    return [server, url, if message then message + ": " else message ]
    
  assertMessage: "${2}Expected ${1} to have been loaded"
  refuteMessage: "${2}Expected ${1} to not have been loaded"
  expectation: 'toHaveRequestedTheUrl'
}
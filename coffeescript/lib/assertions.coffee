buster.assertions.add "urlLoaded", {
  assert: (a) ->
    return false
  
  values: (actual, message) ->
    if (!message?) then message = ''
    return [actual, if message then message + ": " else message ]
    
  assertMessage: "${1}Expected ${0} to have been loaded"
  refuteMessage: "${1}Expected ${0} to not have been loaded"
  expectation: 'toBeAnLoadedUrl'
}
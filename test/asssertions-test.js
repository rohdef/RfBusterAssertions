// Generated by CoffeeScript 1.3.3
(function() {

  buster.testCase("Test assertions", {
    setUp: function() {
      var script, scripts, _i, _len, _results;
      this.server = this.useFakeServer();
      this.url = 'dummy.js';
      this.urlWithGet = this.url + "?random=get&parameters=work";
      scripts = document.getElementsByTagName('script');
      _results = [];
      for (_i = 0, _len = scripts.length; _i < _len; _i++) {
        script = scripts[_i];
        _results.push(script.parentElement.removeChild(script));
      }
      return _results;
    },
    "URL is registered on XHR": function() {
      var request;
      request = new XMLHttpRequest();
      request.open('GET', this.url, false);
      request.send();
      assert.urlRequest(this.server, "dummy.js");
      return expect(this.server).toHaveRequestedTheUrl("dummy.js");
    },
    "URL is registered when adding a script element to head": function() {
      var script;
      script = document.createElement("script");
      script.type = "text/javascript";
      script.src = this.url;
      document.head.appendChild(script);
      assert.urlRequest(this.server, "dummy.js");
      return expect(this.server).toHaveRequestedTheUrl("dummy.js");
    },
    "URL is registered when adding a script element to body": function() {
      var script;
      script = document.createElement("script");
      script.type = "text/javascript";
      script.src = this.url;
      document.body.appendChild(script);
      assert.urlRequest(this.server, "dummy.js");
      return expect(this.server).toHaveRequestedTheUrl("dummy.js");
    },
    "URL registered ignores get parameters": function() {
      var request;
      request = new XMLHttpRequest();
      request.open('GET', this.urlWithGet, false);
      request.send();
      assert.urlRequest(this.server, "dummy.js");
      return expect(this.server).toHaveRequestedTheUrl("dummy.js");
    },
    "Get params can be tested": function() {}
  });

}).call(this);

#!/usr/bin/env node

var http = require('http');
http.createServer(function (req, res) {
      if (req.method == 'GET' && (/^ping/).test(req.url)){
          var target;
          target = req.url.substring(req.url.index('?'), req.url.len);
          console.log('GET: ', target);
      }

      if (req.method == 'GET' && (/^get/).test(req.url)){

      }
      res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');

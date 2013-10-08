#!/usr/bin/env node

var http = require('http');
var opt_ping_post ={
    hostname: 'www.17ce.com',
    port: 80,
    path: '/site/ping',
    headers : {'User-Agent': '', 'Referer': 'http://www.17ce.com/'},
    method: 'POST'
};

function ping_get_tid (target) {
    opt = opt_ping_post;
    var req = http.request(opt,function(res){
        console.log('target: ' + target);
        console.log(opt);
        res.on('data', function(chunk) {
            console.log('Response: '+ chunk);
        })
        
    });

    req.write("&url="+target+"&curl=&rt=1&nocache=0&host=&referer=&cookie=&agent=&speed=&pingcount=&pingsize=&area[]=0&area[]=1&area[]=2&area[]=3&&isp[]=0&isp[]=1&isp[]=2&isp[]=6&isp[]=7&isp[]=8&isp[]=4&");
    req.end();
}

http.createServer(function (req, res) {
      if (req.method == 'GET' && (/^\/ping/).test(req.url)){
          var target;
          target = req.url.substring(req.url.indexOf('?')+1, req.url.len);
          ping_get_tid(target);
      }

      if (req.method == 'GET' && (/^get/).test(req.url)){

      }
      res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end('Hello World\n');
}).listen(1337, '127.0.0.1');


console.log('Server running at http://127.0.0.1:1337/');

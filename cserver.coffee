#!/usr/bin/env coffee
http = require 'http'

opt_ping = 
    hostname: 'www.17ce.com'
    port: 80
    path: '/site/ping'
    headers :
        'User-Agent': ''
        'Referer': 'http://www.17ce.com/'
    method: 'POST'

ping_get_pid = (hostname) ->
    req = http.request opt_ping, (res) ->
        res.on 'data',(chunk) ->
            console.log 'Response: \n'+chunk

    
    load = '&url=' + hostname + '&curl=&rt=1&nocache=0&host=&referer=&cookie=&agent=&speed=&pingcount=&pingsize=&area[]=0&area[]=1&area[]=2&area[]=3&&isp[]=0&isp[]=1&isp[]=2&isp[]=6&isp[]=7&isp[]=8&isp[]=4&' 
    console.log load
    req.write load
    req.end()


srv = http.createServer (req,res) ->
    hostname = req.url.substring req.url.indexOf('?')+1, req.url.len
    console.log hostname
    if req.method is 'GET' and (/^\/ping/).test req.url
        console.log 'in trap'
        ping_get_pid hostname
    res.writeHead 200, {'Content-Type' : 'text/plain'}
    res.end 'hello world\n'

srv.listen 1337,'127.0.0.1'

console.log 'Server running at http://127.0.0.1:1337/'

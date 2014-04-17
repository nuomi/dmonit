#!/usr/bin/env python

import sys
import requests, json
import urllib

site_http_payload = {
        'curl':'',
        'rt':'1',
        'nocache':'0',
        'host':'',
        'referer':'',
        'cookie':'',
        'agent':'',
        'speed':'',
        'pingcount':'',
        'pingsize':'',
        'area[]':'0',
        'area[]':'2',
        'area[]':'3',
        'area[]':'1',
        'isp[]':'0',
        'isp[]':'1',
        'isp[]':'2',
        'isp[]':'6',
        'isp[]':'7',
        'isp[]':'8',
        'isp[]':'4',
}

site_http_headers = {
    'Agent':'Mozilla/5.0 (X11; Linux x86_64; rv:20.0) Gecko/20100101 Firefox/20.0',
    'Referer':'http://www.17ce.com/'
}

def site_http(target):
    payload = site_http_payload
    payload['url'] = urllib.quote(target)
    print payload
    ret = requests.post('http://www.17ce.com/site/http', data = payload, headers = site_http_headers)
    print ret


if __name__ == '__main__':
    for arg in sys.argv[1:]:
        site_http(arg)

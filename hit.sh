#!/usr/bin/env bash

function post_site_http {
    curl -# -A "Mozilla/5.0 (X11; Linux x86_64; rv:20.0) Gecko/20100101 Firefox/20.0" -d "&url=$1&curl=&rt=1&nocache=0&host=&referer=&cookie=&agent=&speed=&pingcount=&pingsize=&area[]=0&area[]=1&area[]=2&area[]=3&&isp[]=0&isp[]=1&isp[]=2&isp[]=6&isp[]=7&isp[]=8&isp[]=4&" -e "http://www.17ce.com/" http://www.17ce.com/site/http
}

function post_site_ajaxfresh {
    filename=$(echo $1.$(date +%s).json)
    curl -# -A "" -d "tid=$1&&num=0&&ajax_over=0" -e "http://www.17ce.com/" http://www.17ce.com/site/ajaxfresh > $filename
    taskstatus=`cat $filename | grep -e "taskstatus\":\"2"`
    echo taskstatus is $taskstatus
    if [ "$taskstatus" = "" ]; then
        exit 0
    else
        sleep 2
        post_site_ajaxfresh $1
    fi

}

function usage {
    echo "usage: $0 url"
}

if [ "$1" = "" ]; then
    usage
else
    tid=$(post_site_http $1 | python -c "import json,sys; print json.load(sys.stdin)['tid']") 
    post_site_ajaxfresh $tid
fi




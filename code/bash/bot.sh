#!/bin/bash

IP="10.1.10.101"

options=("bot" "safe")
select opt in "${options[@]}"
do
    case $opt in
        "bot")
            USER_AGENT="user_agents_bots.txt"
            break
            ;;
        "safe")
            USER_AGENT="user_agents.txt"
            break
            ;;

        *) echo "invalid";;
    esac
done

URLS="urls.txt"

REQ=20

get_random_line() {
    local file=$1
    shuf -n 1 "$file"
}

for i in $(seq 1 $REQ); do
    RANDOM_AGENT=$(get_random_line "$USER_AGENT")
    RANDOM_URL=$(get_random_line "$URLS")

    URL="http://10.1.10.101$RANDOM_URL"
    curl -k --user-agent "$RANDOM_AGENT" -H  "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate" -H "Connection: keep-alive" "$URL"
    #curl -k -A "$RANDOM_AGENT" "$URL"
done

#!/bin/sh

if [[ ! -z $node ]]; then
    node=127.0.0.1:8098
fi

function storeInRiak {
    echo "Storing $1 as $2";
    curl -X PUT "http://$node/riak/jsconf/$1" -H "Content-Type: $2" --data-binary @$1
}

for file in *.gif; do
    storeInRiak $file 'image/gif'
done

for file in *.jpg; do
    storeInRiak $file 'image/jpeg'
done

for file in *.png; do
    storeInRiak $file 'image/png'
done

storeInRiak slides 'text/html'

#!/bin/sh

libs=$(cat libs)

#pushd .
# cd /deployments

for jar in $(ls | grep -e ".*\.jar$"); do
    present=false
    for lib in $libs; do
        if [ "$jar" == "$lib" ]; then
            present=true
        fi
    done
    if [ "$present" == "false" ]; then
        echo "rm $jar"
    fi
done

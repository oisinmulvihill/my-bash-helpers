#!/bin/bash
#
# A quick check whether a connection to a HOST and PORT will work. This will
# use netcat if its present. If not it will failover to using
#
# References:
#  * http://stackoverflow.com/questions/4922943/how-to-test-if-remote-tcp-port-is-opened-from-shell-script
#  * http://stackoverflow.com/questions/9609130/quick-way-to-find-if-a-port-is-open-on-linux
#  * http://www.catonmat.net/blog/tcp-port-scanner-in-bash/
#
# Tested on my Mac 10.9.4 and ubuntu VMs.
#
# Oisin Mulvihill
# 2014-08-20
#
function tcptest () {
    # Given the HOST (IP or hostname) & TCP Port attempt a connection show
    # the result to the console.
    HOST=$1
    PORT=$2
    RESUlT=0

    # If netcat is present use this otherwise fall back to bash
    # socket connections.
    if [ -x "$(which nc)" ] ; then
        # netcat not in path and executable, fallback:
        timeout 5 bash -c "6<>/dev/tcp/$HOST/$PORT"
        RESULT=$?
    else
        nc -z -w5 $HOST $PORT
        RESULT=$?
    fi

    if [ "$RESULT" -eq 0 ] ; then
        echo "Connection ok to '$HOST:$PORT'."
    else
        echo "No one is listening on '$HOST:$PORT'."
    fi

    return $RESULT
}


#!/bin/bash
host=$1
com=${2:-connect}

case $com in
    connect)
        ssh $host
        ;;

    send)
        what=$3
        where=${4:-.}
        scp -r  $what $host:$where
        ;;

    bring)
        what=$3
        where=${4:-.}
        scp -r $host:$what $where
        ;;

    tunnel)
        port=${3:-8888}
        ssh -N -f -L localhost:$port:localhost:$port $host
esac

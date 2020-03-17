#!/bin/bash

docker run -it --net host \
    -v $(pwd)/iperf.py:/iperf.py \
    -v $(pwd)/${3}:/out.csv \
    luxas/iperf:3.7 \
    /bin/bash -c "\
        python3 /iperf.py ${1} ${2} /out.csv ${4} ${5}"

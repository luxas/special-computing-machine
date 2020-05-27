#!/bin/bash
cd iperf-install/bin

# ARGS: [SERVER] [IPERF FLAGS...]

SERVER=$1
shift

IS_TCP_MODE=1
# If the args contain, -u, set IS_TCP_MODE to 0
[[ $@ =~ '-u' ]] && IS_TCP_MODE=0

# start server if doing localhost testing
if [[ ${SERVER} == "localhost" ]]; then
        ./iperf3 -s &
        IPERF_SERVER_PID=$!
        sleep 3
fi

JSON_FILE=${LOG_FILE}.json
./iperf3 -c ${SERVER} --json $@ > ${JSON_FILE}
echo $? > ~/test-exit-status

sed '1,// s/"sum_received"/"sum_received_sender"/' -i ${JSON_FILE}
sed '1,// s/"sum_sent"/"sum_sent_sender"/' -i ${JSON_FILE}
sed '1,// s/"sum_received"/"sum_received_receiver"/' -i ${JSON_FILE}
sed '1,// s/"sum_sent"/"sum_sent_receiver"/' -i ${JSON_FILE}

function jq_avg() {
    jq "([$1] | map(select(. > 0))) as \$arr | (\$arr | ((0+add) / ([length,1] | max)))" ${JSON_FILE}
}

# NOTE: UDP mode does not support --bidir. The same value will be returned in mbps/lost packets regardless of --bidir value

printf "mbps: " | tee -a ${LOG_FILE}
jq_avg ".end.sum_received_sender.bits_per_second,.end.sum_received_receiver.bits_per_second,((.end.sum.bits_per_second+0) * (1 - ((.end.sum.lost_percent+0) / 100)))" | awk '{printf("%.1f\n",$1/1000000)}' | tee -a ${LOG_FILE}

if [[ ${IS_TCP_MODE} == 1 ]]; then
    printf "retransmits: " | tee -a ${LOG_FILE}
    # The loss percent could become zero, in a good case. Always add 0.1 so zero-results are visible in the stats
    jq_avg ".end.sum_sent_sender.retransmits,.end.sum_sent_receiver.retransmits" | awk '{printf("%.1f\n",$1+0.1)}' | tee -a ${LOG_FILE}

    # Original mean rtt is counted in microseconds, convert to ms
    printf "mean_rtt_ms: " | tee -a ${LOG_FILE}
    jq -r '([.end.streams[] | .sender.mean_rtt] | add+0) / (.end.streams | ([length,1] | max))' ${JSON_FILE} | awk '{printf("%.1f\n",$1/1000)}' | tee -a ${LOG_FILE}
else
    printf "lost_packet_percent: " | tee -a ${LOG_FILE}
    # The loss percent could become zero, in a good case. Always add 0.1 so zero-results are visible in the stats
    jq -r '(.end.sum.lost_percent+0)' ${JSON_FILE} | awk '{printf("%.1f\n",$1+0.1)}' | tee -a ${LOG_FILE}

    # Original jitter is reported in ms, converted to us here for displaying
    printf "jitter_us: " | tee -a ${LOG_FILE}
    jq -r '(.end.sum.jitter_ms+0)*1000' ${JSON_FILE} | awk '{printf("%.1f\n",$1)}' | tee -a ${LOG_FILE}
fi

if [[ ${SERVER} == "localhost" ]]; then
        kill $IPERF_SERVER_PID
fi

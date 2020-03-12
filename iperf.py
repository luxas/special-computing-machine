import subprocess
import csv
import os
import sys
import json
from pathlib import Path


class test_result:
    def __init__(self, mode, device, mbps, retransmit, mean_rtt, host_comp, remote_comp):
        self.mode = mode
        self.device = device
        self.mbps = mbps
        self.retransmit = retransmit
        self.mean_rtt = mean_rtt
        self.host_comp = host_comp
        self.remote_comp = remote_comp
    def to_csv(self, csv_file):
        csv_file.write('{:s},{:s},{:f},{:d},{:f},{:f},{:f}\n'.format(self.mode,
                                                                   self.device,
                                                                   self.mbps,
                                                                   self.retransmit,
                                                                   self.mean_rtt,
                                                                   self.host_comp,
                                                                   self.remote_comp))

mode = sys.argv[1]
ip_address = sys.argv[2]
output_csv = sys.argv[3]
repeat_time = int(sys.argv[4])
device = sys.argv[5]


mode_list = ['tcp', 'tcp-dual', 'udp-dual']
if mode not in mode_list:
    print("Invalid mode!")

print("Processing...")

#create csv file
if not os.path.exists(output_csv):
    my_csv = open(output_csv, 'w')
    my_csv.write('Mode,Mbps,Retransmits,Mean RTT,Host CPU,Remote CPU')
else:
    my_csv = open(output_csv, 'a')



#run iperf3 n times
result_list = []
for i in range(0, repeat_time):
    filename = "report-{}-{}-{}.json".format(mode, device, i)
    subprocess.run(["/bin/bash", "-c", "iperf3 -c {} --json > {}".format(ip_address, filename)])

    with open(filename) as json_file:
        data = json.load(json_file)
        mbps = data["end"]["sum_sent"]["bits_per_second"]
        retransmit = data["end"]["streams"][0]["sender"]["retransmits"]
        mean_rtt =  data["end"]["streams"][0]["sender"]["mean_rtt"]
        host_comp = data["end"]["cpu_utilization_percent"]["host_total"]
        remote_comp = data["end"]["cpu_utilization_percent"]["remote_total"]


    result_list.append(test_result(mode, device, mbps, retransmit, mean_rtt, host_comp, remote_comp))
    result_list[i].to_csv(my_csv)


my_csv.close()



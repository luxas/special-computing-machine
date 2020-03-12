import subprocess
import csv
import os
import sys
import json

class tcp_result:
    def __init__(self, mode, device, mbps, retransmit, mean_rtt, host_comp, remote_comp):
        self.mode = mode
        self.device = device
        self.mbps = mbps
        self.retransmit = retransmit
        self.mean_rtt = mean_rtt
        self.host_comp = host_comp
        self.remote_comp = remote_comp
    def write_to_csv_file(self, csv_file):
        csv_file.write('{:s},{:s},{:f},{:f},{:f},{:d},{:d},{:f}\n'.format(
            self.mode, self.device, self.mbps, self.host_comp, self.remote_comp,self.retransmit, self.mean_rtt,0))
        csv_file.flush()

class udp_result:
    def __init__(self, device, mbps, host_comp, remote_comp, loss_percent):
        self.mode = "udp"
        self.device = device
        self.mbps = mbps
        self.host_comp = host_comp
        self.remote_comp = remote_comp
        self.loss_percent = loss_percent
    def write_to_csv_file(self, csv_file):
        csv_file.write('{:s},{:s},{:f},{:f},{:f},{:d},{:d},{:f}\n'.format(
            self.mode, self.device, self.mbps, self.host_comp, self.remote_comp,0,0,self.loss_percent))
        csv_file.flush()


def run_tcp(ip_address, filename):
    subprocess.run(["/bin/bash", "-c", "iperf3 -c {} --json > {}".format(ip_address, filename)])

    with open(filename) as json_file:
        data = json.load(json_file)
        mbps = data["end"]["sum_received"]["bits_per_second"] / 1000000
        retransmit = data["end"]["streams"][0]["sender"]["retransmits"]
        mean_rtt =  data["end"]["streams"][0]["sender"]["mean_rtt"]
        host_comp = data["end"]["cpu_utilization_percent"]["host_total"]
        remote_comp = data["end"]["cpu_utilization_percent"]["remote_total"]

    # Return the resulting row
    return tcp_result("tcp", device, mbps, retransmit, mean_rtt, host_comp, remote_comp)

def run_tcp_dual(ip_address, filename):
    subprocess.run(["/bin/bash", "-c", "iperf3 -c {} --bidir --json > {}".format(ip_address, filename)])

    # Fixup the invalid JSON syntax
    #subprocess.run(["/bin/bash", "-c", 'sed "1,// s/sum_sent/sum_sent_first/" -i {}'.format(filename)])
    subprocess.run(["/bin/bash", "-c", 'sed "1,// s/sum_received/sum_received_first/" -i {}'.format(filename)])

    with open(filename) as json_file:
        data = json.load(json_file)
        mbps = (data["end"]["sum_received_first"]["bits_per_second"] + data["end"]["sum_received"]["bits_per_second"]) / 1000000
        retransmit = data["end"]["streams"][0]["sender"]["retransmits"]
        mean_rtt =  data["end"]["streams"][0]["sender"]["mean_rtt"]
        host_comp = data["end"]["cpu_utilization_percent"]["host_total"]
        remote_comp = data["end"]["cpu_utilization_percent"]["remote_total"]

    # Return the resulting row
    return tcp_result("tcp-dual", device, mbps, retransmit, mean_rtt, host_comp, remote_comp)

def run_udp(ip_address, filename):
    subprocess.run(["/bin/bash", "-c", "iperf3 -c {} -b 0 -w 256K --udp --json > {}".format(ip_address, filename)])

    with open(filename) as json_file:
        data = json.load(json_file)
        mbps = data["end"]["sum"]["bits_per_second"] / 1000000
        host_comp = data["end"]["cpu_utilization_percent"]["host_total"]
        remote_comp = data["end"]["cpu_utilization_percent"]["remote_total"]
        loss_percent = data["end"]["sum"]["lost_percent"]

    # Return the resulting row
    return udp_result(device, mbps, host_comp, remote_comp, loss_percent)


# Main program starts

# Validate argument number
if len(sys.argv) != 6:
    print("Usage: [MODE=(tcp|tcp-dual|udp-dual)] [IP_ADDRESS] [OUTPUT_FILE] [REPEATS] [DEVICE_NAME]")
    exit()

# Parse the arguments
mode = sys.argv[1]
ip_address = sys.argv[2]
output_csv = sys.argv[3]
repeat_time = int(sys.argv[4])
device = sys.argv[5]

# Verify that the mode is valid
modes = {
    'tcp': [run_tcp],
    'tcp-dual': [run_tcp_dual],
    'udp': [run_udp],
    'all': [run_tcp, run_tcp_dual,run_udp]
}
if mode not in modes:
    print("Invalid mode!")
    exit()

print("Processing...")

# Create csv file with the right column headers, or append to the file
if not os.path.exists(output_csv):
    my_csv = open(output_csv, 'w')
    my_csv.write('Mode,Device,Mbps,Host CPU,Remote CPU,Retransmits (TCP),Mean RTT (TCP),Lost Packets (UDP)\n')
else:
    my_csv = open(output_csv, 'a')

# Run iperf3 n times
result_list = []
for i in range(0, repeat_time):
    # TODO: This should use different filenames for different modes of the for loop below
    filename = "report-{}-{}-{}.json".format(mode, device, i)
    
    # Select the testing functions to run based on the mode
    for test_func in modes[mode]:
        result = test_func(ip_address, filename)
        print("Ran iperf against {} in {} mode, round {}, got {} Mbps...".format(ip_address, result.mode, i+1, result.mbps))

        # Write the result to the CSV file, and append it to the list for later analysis
        result.write_to_csv_file(my_csv)
        result_list.append(result)

# Close the csv file
my_csv.close()

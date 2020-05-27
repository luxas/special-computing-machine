#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import sys
import os
import subprocess

baseresult = sys.argv[1]
mergeresult = sys.argv[2]

if len(sys.argv) != 3:
    print("Usage: [BASE RESULT] [MERGE RESULT]")
    exit()

combinedresult = baseresult + "-" + mergeresult + "-combined"

phoronixdir = os.path.join(os.getenv("HOME"), ".phoronix-test-suite/test-results")
baseresultdir = os.path.join(phoronixdir, baseresult)
mergeresultdir = os.path.join(phoronixdir, mergeresult)
combinedresultdir = os.path.join(phoronixdir, combinedresult)

baseresultfile = os.path.join(baseresultdir, "composite.xml")
mergeresultfile = os.path.join(mergeresultdir, "composite.xml")
combinedresultfile = os.path.join(combinedresultdir, "composite.xml")

if not os.path.exists(combinedresultdir):
    subprocess.run("cp -r {} {}".format(baseresultdir, combinedresultdir), shell=True)

et1 = ET.parse(baseresultfile)
et2 = ET.parse(mergeresultfile)
root1 = et1.getroot()
root2 = et2.getroot()

def find_result(root, desc, scale):
    for result in root:
        if result.tag != "Result":
            continue

        cur_desc = result[4].text
        if cur_desc != desc:
            continue

        cur_scale = result[5].text
        if cur_scale != scale:
            continue

        return result[8][0][2].text

for result1 in root1:
    if result1.tag != "Result":
        if result1.tag == "Generated":
            result1[0].text = combinedresult
        continue

    desc = result1[4].text
    scale = result1[5].text
    prev_results = result1[8][0][2].text

    new_results = find_result(root2, desc, scale)
    new_result_str = prev_results + ":" + new_results
    result1[8][0][2].text = new_result_str

    result_sum = 0
    count = 0
    for numstr in new_result_str.split(":"):
        result_sum += float(numstr)
        count += 1

    result1[8][0][1].text = str(round(result_sum / count, 1))

et1.write(combinedresultfile)


subprocess.run(r"sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}//g;s/- Target Bandwidth: [0-9]\{1,3\}[m]* //g;s/-b [0-9]\{1,3\}[m]* //g' " + combinedresultfile, shell=True)

apt update && apt upgrade -y
hostnamectl set-hostname rpiX
# reboot

# apt-get download phoronix-test-suite
# dpkg --ignore-depends=php5-cli --ignore-depends=php5-gd -i phoronix-test-suite*.deb

wget -q https://github.com/phoronix-test-suite/phoronix-test-suite/releases/download/v9.4.1/phoronix-test-suite_9.4.1_all.deb
apt install php-cli php-gd php7.3-xml php7.3-curl php7.3-sqlite php7.3-bz2 byobu -y --no-install-recommends
apt install ./phoronix-*.deb -y --no-install-recommends


# mkdir phoronix-deb
# dpkg-deb -x phoronix-test-suite*.deb phoronix-deb
# dpkg-deb --control phoronix-test-suite*.deb phoronix-deb/DEBIAN
# sed "s|php5|php|g" -i phoronix-deb/DEBIAN/control
# dpkg -b phoronix-deb phoronix-test-suite-new.deb
# apt install ./phoronix-test-suite-new.deb
# rm -r ./phoronix-*

sed -i "s|1000|550|" /var/lib/phoronix-test-suite/test-profiles/pts/iperf-1.1.0/test-definition.xml
sed -i "s|<TimesToRun>3|<TimesToRun>10|" /var/lib/phoronix-test-suite/test-profiles/pts/iperf-1.1.0/test-definition.xml
sed -i "s|sender|receiver|g" /var/lib/phoronix-test-suite/test-profiles/pts/iperf-1.1.0/results-definition.xml


<ResultsParser>
    <OutputTemplate>[ 10]   0.00-30.04  sec  1.74 GBytes   497 Mbits/sec  0.017 ms  134923/1424330 (#_RESULT_#%)  receiver</OutputTemplate>
    <LineHint>receiver</LineHint>
    <ResultAfterString>Packet Loss Percent</ResultAfterString>
    <ResultScale>Packet Loss Percent</ResultScale>
    <ResultProportion>LIB</ResultProportion>
  </ResultsParser>

# https://math.stackexchange.com/questions/3190768/comparing-two-normal-distributions

https://github.com/axboe/fio/commit/bfed648c9dae6a2459cb43f55c14d8303dcec07b.patch

# Upgrade fio to 3.19
phoronix-test-suite
sed "s|df8e0755ebfd09f761f99bcd47fcafa1|d163747d8f624f9d899d84b0b47bbeb9|g" -i /var/lib/phoronix-test-suite/test-profiles/pts/fio-1.13.0/downloads.xml
sed "s|b44d6470714cf65dff3301942f528eb4ef8463e033649c6e821fca3e706f8914|a2f885834900f554127718716338914791f5d72800b6f9e3edf173b94b5a2e4e|g" -i /var/lib/phoronix-test-suite/test-profiles/pts/fio-1.13.0/downloads.xml
sed "s|1004976|1006012|g" -i /var/lib/phoronix-test-suite/test-profiles/pts/fio-1.13.0/downloads.xml
sed "s|3.18|3.19|g" -i /var/lib/phoronix-test-suite/test-profiles/pts/fio-1.13.0/*
phoronix-test-suite install pts/fio
sed -i "s|<TimesToRun>3|<TimesToRun>20|" /var/lib/phoronix-test-suite/test-profiles/pts/fio-1.13.0/test-definition.xml


phoronix-test-suite result-file-confidence 

ssh pi@192.168.1.24 "cd /var/lib/phoronix-test-suite/test-results && tar -czf- sandiskold32gb" | tar -vxzf- -C ~/.phoronix-test-suite/test-results/
sed "s|SD32G|SD32G_OLD|" -i ~/.phoronix-test-suite/test-results/sandiskold32gb/composite.xml
sed "s|RPI_SSD_MSATA|TEST_DIR|g;s|RPI_SSD_SATA|TEST_DIR|g;s|RPI_SSD_M2|TEST_DIR|g" -i ~/.phoronix-test-suite/test-results/merge-8540/composite.xml
sed "s|THNSN5512GPUK NVMe TOSHIBA|KINGSTON A400 SATA|" -i ~/.phoronix-test-suite/test-results/rpissdsata/composite.xml

sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}//g' ~/.phoronix-test-suite/test-results/${RESULT}/composite.xml
sed -i -e "s/- Target Bandwidth: [0-9]\{1,3\}[m]* //g;s/-b [0-9]\{1,3\}[m]* //g" ~/.phoronix-test-suite/test-results/${RESULT}/composite.xml

cd / && patch -p1 < /home/pi/p.patch && cd -

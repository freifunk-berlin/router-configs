#!/bin/sh -x

./bin/pull.sh zwingli-ost-5ghz 104.130.10.2
./bin/pull.sh zwingli-west-5ghz 104.130.10.4
./bin/pull.sh zwingli-nord-5ghz 104.130.10.6
./bin/pull.sh zwingli-sued-5ghz 104.130.10.8

./bin/pull.sh zwingli-ost-2ghz 104.130.10.10
./bin/pull.sh zwingli-sued-2ghz 104.130.10.12
./bin/pull.sh zwingli-nord-2ghz 104.130.10.14
./bin/pull.sh zwingli-west-2ghz 104.130.10.16

./bin/airos-pull.sh zwingli-fluxfm 104.130.10.18
./bin/airos-pull.sh zwingli-fhain 104.130.10.20
./bin/airos-pull.sh zwingli-nkoelln 104.130.10.22
./bin/airos-pull.sh zwingli-xberg 104.130.10.24

./bin/pull.sh zwingli-core 104.130.10.26

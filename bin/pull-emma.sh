#!/bin/sh -x

./bin/airos-pull.sh emma-nno-m5 104.0.2.18
./bin/airos-pull.sh emma-nnw-m5 104.0.2.34
./bin/airos-pull.sh emma-wnw-m5 104.0.2.50
./bin/airos-pull.sh emma-wsw-m5 104.0.2.66
./bin/airos-pull.sh emma-ssw-m5 104.0.2.82
./bin/airos-pull.sh emma-sso-m5 104.0.2.98
./bin/airos-pull.sh emma-oso-m5 104.0.2.114
./bin/airos-pull.sh emma-ono-m5 104.0.2.130

./bin/pull.sh emma-nno-m2 104.0.2.201
./bin/pull.sh emma-nnw-m2 104.0.2.202
./bin/pull.sh emma-wnw-m2 104.0.2.203
./bin/pull.sh emma-wsw-m2 104.0.2.204
./bin/pull.sh emma-ssw-m2 104.0.2.205
./bin/pull.sh emma-sso-m2 104.0.2.206
./bin/pull.sh emma-oso-m2 104.0.2.207
./bin/pull.sh emma-ono-m2 104.0.2.208

./bin/pull.sh emma-core 104.0.2.9

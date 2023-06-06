#!/bin/sh

MTV="/media/charliepi/HD/MTVSERVER/mtv2.2";
FES="/media/charliepi/HD/MTVSERVER/mtv_frontend_server";
VERSION="0.0.1";
IMG="mtv_frontend_server:$VERSION";

# check if $MTV exists if $MTV exists echo "MTV exists" else echo "MTV does not exist"

if [ -d "$MTV" ]; then
    echo "MTV exists";
    cd $MTV;
    git pull;
    npm run build;
    cp -pvr dist/* $FES/data/;
else
    echo "MTV does not exist";
    git clone https://github.com/cjsmocjsmo/mtv2.2.git;
    cd $MTV;
    npm run build;
    cp -pvr dist/* $FES/data/;
fi

# cd $FES;
# git pull;
docker build -t $IMG .;
docker run -d -p 8456:8456 $IMG;

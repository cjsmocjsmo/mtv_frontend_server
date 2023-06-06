#!bin/sh

git pull;
cargo build --release;

# remove /usr/bin/mtv_frontend_server if it exists

if [ -f /usr/bin/mtv_frontend_server ]; then
    sudo rm /usr/bin/mtv_frontend_server;
fi

# copy the new binary to /usr/bin/mtv_frontend_server and make /usr/bin/mtv_frontend_server executalbe

sudo cp target/release/mtv_frontend_server /usr/bin/mtv_frontend_server;
sudo chmod +x /usr/bin/mtv_frontend_server;
sudo systemctl enable mtv_frontend_server.service;
sudo systemctl restart mtv_frontend_server.service;
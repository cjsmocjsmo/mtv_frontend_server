Steps to update

1. systemctl stop mtv_frontend_server
2. git pull
3. cargo build --release
4. sudo rm /usr/bin/mtv_frontend_server
5. sudo mv target/release/mtv_frontend_server /usr/bin/
6. sudo chmod +x /usr/bin/mtv_frontend_server
7. sudo systemctl enable mtv_frontend_server
8. sudo systemctl start mtv_frontend_server
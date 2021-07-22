#!/bin/bash
sudo chown -R redis:redis /var/log/redis
sudo chmod -R u+rwx,g+rwx,u+rx /var/log
sudo chmod +r /etc/redis/redis.conf

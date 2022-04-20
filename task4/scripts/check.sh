#!/bin/bash

while [ ! -f /var/tmp/finished-user-data ]
    do
        echo -e "Waiting for user-data..."
        sleep 1
done
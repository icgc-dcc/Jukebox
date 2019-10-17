#!/bin/sh
cd {{ run_dir }}
docker-compose down
docker-compose up -d

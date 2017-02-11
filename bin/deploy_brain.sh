#!/bin/bash
#
#  Runs `brain` Docker container
#  locally using provided image
#  version and port number.
#
LOCAL_PORT=$1
VERSION=$2

docker run \
	--name brain \
	--publish $LOCAL_PORT:5432 \
	-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
	-e ANALYST_PASSWORD=$ANALYST_PASSWORD \
	-e REPORTER_PASSWORD=$REPORTER_PASSWORD \
	--volume=$(pwd)/database_data:/var/lib/postgresql/data \
	--detach brain:$VERSION
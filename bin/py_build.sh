# Project Env
. $(dirname $0)/env.sh

# Determine Tag
IMAGE_NAME=$PROJ_NAME
IMAGE_TAG=tmp

# Docker Build
DOCKER_BUILDKIT=1 docker build . --build-arg LOGIQX_DEBUG -t $IMAGE_NAME:$IMAGE_TAG

# Copy the library scripts
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/constants.py >$PROJ_DIR/python/constants.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/common.py >$PROJ_DIR/python/common.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/name.py >$PROJ_DIR/python/name.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/fuzzy.py >$PROJ_DIR/python/fuzzy.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/entrant.py >$PROJ_DIR/python/entrant.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/filter.py >$PROJ_DIR/python/filter.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/speedrun.py >$PROJ_DIR/python/speedrun.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/period.py >$PROJ_DIR/python/period.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/course.py >$PROJ_DIR/python/course.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/session.py >$PROJ_DIR/python/session.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/event.py >$PROJ_DIR/python/event.py

# Clear pycache
rm -f $PROJ_DIR/python/__pycache__/*.*.pyc

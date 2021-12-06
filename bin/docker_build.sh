# Project Env
. $(dirname $0)/env.sh

# Determine Tag
IMAGE_NAME=$PROJ_NAME
IMAGE_TAG=$(git rev-parse --short=12 HEAD)

# Docker Build
DOCKER_BUILDKIT=1 docker build . --file Dockerfile-slim --build-arg LOGIQX_DEBUG -t $IMAGE_NAME:$IMAGE_TAG

# Run unit tests
run_py_script entrant.py
run_py_script filter.py
run_py_script speedrun.py
run_py_script course.py
run_py_script session.py
run_py_script event.py

# Run daily reporting
run_py_script results.py

# Docker Tag
docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest

# Project Env
. $(dirname $0)/env.sh

# Remove all tagged images prior to latest
docker image rm -f $(docker image ls --filter "before=$IMAGE_NAME:latest" --format "{{.Repository}}:{{.Tag}}" $IMAGE_NAME)

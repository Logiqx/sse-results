PROJ_DIR=$(realpath $(dirname $0)/..)
PROJ_NAME=$(basename $PROJ_DIR)
WORK_DIR=/home/jovyan/work/$PROJ_NAME

run_py_script()
{
  docker run -it --rm \
         --mount type=bind,src=$PROJ_DIR/2018,dst=$WORK_DIR/2018,readonly \
         --mount type=bind,src=$PROJ_DIR/2019,dst=$WORK_DIR/2019,readonly \
         --mount type=bind,src=$PROJ_DIR/2021,dst=$WORK_DIR/2021,readonly \
         --mount type=bind,src=$PROJ_DIR/2022,dst=$WORK_DIR/2022,readonly \
         --mount type=bind,src=$PROJ_DIR/config,dst=$WORK_DIR/config,readonly \
         --mount type=bind,src=$PROJ_DIR/docs,dst=$WORK_DIR/docs \
         ${PROJ_NAME}:${IMAGE_TAG:-latest} python/$1
}

# Explanation at https://www.peterbe.com/plog/set-ex
set -ex

cd $PROJ_DIR

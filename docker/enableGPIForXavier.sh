#!/bin/bash
#Jason T. 2-6-2018

# Check specifically for the run command
if [[ $# -ge 2 && $1 == "run" ]]; then
    # Tell docker to share the following folders with the base system
    # This allows the docker containers to find CUDA, cuDNN, TensorRT
    LIB_MAPS="/usr/lib/aarch64-linux-gnu \
              /usr/local/cuda \
              /usr/local/cuda/lib64"
		 
    # GPU device sharing is for a docker container to have access to
    # system devices as found in the /dev directory
    DEVICES="/dev/nvhost-ctrl \
             /dev/nvhost-ctrl-gpu \
             /dev/nvhost-prof-gpu \
             /dev/nvmap \
             /dev/nvhost-gpu \
             /dev/nvhost-as-gpu"
	
	# There is a need to map the libraries inside the container
	# in the exact way programs would expect to find them as
	# though the TX2 were operating without containers
	LIBS=""
	for lib in $LIB_MAPS; do
		LIBS="$LIBS -v $lib:$lib"
	done
	
	DEVS=""
	for dev in $DEVICES; do
		DEVS="$DEVS --device=$dev"
	done
	
	#echo "docker run $LIBS $DEVS ${@:2}"
	docker run $LIBS $DEVS ${@:2}
else
    # Run command not found, run everything straight through docker
    #echo "docker $@"
	docker $@
fi

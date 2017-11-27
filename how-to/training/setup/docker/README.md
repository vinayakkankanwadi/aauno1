
## DOCKER IMAGE PROCESS

[DOCKER](https://www.docker.com/) is the preferred way to set up a environment as it allows the user to completely isolate all software changes.

[MAC](https://download.docker.com/mac/stable/Docker.dmg)

### Docker version
```
docker -v
Docker version 17.09.0-ce, build afdb6d4
```

### Docker image before
```
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

### Docker file
```
MacBook-Pro-4:docker$ cat Dockerfile.base 
#BASE IMAGE
FROM ubuntu

#AUTHOR @vinayak
MAINTAINER @vinayak
# This is the base container for AAUNO
```

### Docker build image
```
MacBook-Pro4:docker$ docker build -f Dockerfile.base -t base .
Sending build context to Docker daemon   7.68kB
Step 1/2 : FROM ubuntu
latest: Pulling from library/ubuntu
660c48dd555d: Pull complete 
4c7380416e78: Pull complete 
421e436b5f80: Pull complete 
e4ce6c3651b3: Pull complete 
be588e74bd34: Pull complete 
Digest: sha256:7c67a2206d3c04703e5c23518707bdd4916c057562dd51c74b99b2ba26af0f79
Status: Downloaded newer image for ubuntu:latest
 ---> 20c44cd7596f
Step 2/2 : MAINTAINER @vinayak
 ---> Running in 619db69118b2
 ---> d21b41bd6003
Removing intermediate container 619db69118b2
Successfully built d21b41bd6003
Successfully tagged base:latest
```

### Docker image after
```
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
base                latest              d21b41bd6003        1 second ago        123MB
ubuntu              latest              20c44cd7596f        9 days ago          123MB
```

### Docker run image
```
MacBook-Pro-4:docker$ docker run -it base
root@4f048cd5381d:/# uname -a
Linux 4f048cd5381d 4.9.49-moby #1 SMP Wed Sep 27 23:17:17 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
root@4f048cd5381d:/# exit
exit
```

### Docker tag image and check
```
MacBook-Pro-4:docker$ docker tag d21b41bd6003 aauno/base:latest
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
aauno/base          latest              d21b41bd6003        57 seconds ago      123MB
base                latest              d21b41bd6003        57 seconds ago      123MB
ubuntu              latest              20c44cd7596f        9 days ago          123MB
```

### Docker push image to hub
```
MacBook-Pro-4:docker$ docker push aauno/base
The push refers to a repository [docker.io/aauno/base]
2f5b0990636a: Mounted from library/ubuntu 
c9748fbf541d: Mounted from library/ubuntu 
b3968bc26fbd: Mounted from library/ubuntu 
aa4e47c45116: Mounted from library/ubuntu 
788ce2310e2f: Mounted from library/ubuntu 
latest: digest: sha256:2a8c402067ea5aeb869382df1b5eeebca65e091a647b6c48f5de03613ed8efce size: 1357
```

### Docker clean all local images
```
MacBook-Pro-4:docker$ 
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
aauno/base          latest              d21b41bd6003        57 seconds ago      123MB
base                latest              d21b41bd6003        57 seconds ago      123MB
ubuntu              latest              20c44cd7596f        9 days ago          123MB

MacBook-Pro-4:docker$ docker rmi -f d21b41bd6003 20c44cd7596f
Untagged: aauno/base:latest
Untagged: aauno/base@sha256:2a8c402067ea5aeb869382df1b5eeebca65e091a647b6c48f5de03613ed8efce
Untagged: base:latest
Deleted: sha256:d21b41bd6003d1d9e2b5ff2574dbb102ab5d04e178af914dd3f9d3fb9e4c0cd0
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:7c67a2206d3c04703e5c23518707bdd4916c057562dd51c74b99b2ba26af0f79
Deleted: sha256:20c44cd7596ff4807aef84273c99588d22749e2a7e15a7545ac96347baa65eda

MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

### Docker run pulled image to check
```
MacBook-Pro-4:docker$ docker run -it aauno/base
Unable to find image 'aauno/base:latest' locally
latest: Pulling from aauno/base
660c48dd555d: Already exists 
4c7380416e78: Already exists 
421e436b5f80: Already exists 
e4ce6c3651b3: Already exists 
be588e74bd34: Already exists 
Digest: sha256:2a8c402067ea5aeb869382df1b5eeebca65e091a647b6c48f5de03613ed8efce
Status: Downloaded newer image for aauno/base:latest
root@4cb5f16d372b:/# uname -a
Linux 4cb5f16d372b 4.9.49-moby #1 SMP Wed Sep 27 23:17:17 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
root@4cb5f16d372b:/# exit
exit

MacBook-Pro-4:docker$ 
```

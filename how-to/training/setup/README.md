# SETUP
Development, Testing, Software, Hardware setup goes here

## TOC

- [DEVELOPMENT SETUP] docker container for dev/test
- SOFTWARE SETUP
- HARDWARE SETUP

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
FROM aarch64/ubuntu

#AUTHOR <email>@<domain>.com
MAINTAINER <email>@<domain>.com
```

### Docker build image
```
MacBook-Pro4:docker$ docker build -f Dockerfile.base -t base .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM aarch64/ubuntu
latest: Pulling from aarch64/ubuntu
8944e166ce98: Already exists 
1f8c28d8b7a9: Already exists 
9dbf9f348171: Already exists 
5cb9db57901b: Already exists 
7e21759f0cbf: Already exists 
Digest: sha256:e76f340967a53686298c57e4d388218652f01dc9b4905e8bd32b9d2bcbc4cfa4
Status: Downloaded newer image for aarch64/ubuntu:latest
 ---> 5227400055a2
Step 2/2 : MAINTAINER <email>@<domain>.com
 ---> Running in 187c41289b82
 ---> a0bf9e42024a
Removing intermediate container 187c41289b82
Successfully built a0bf9e42024a
Successfully tagged base:latest
```

### Docker image after
```
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
base                latest              a0bf9e42024a        5 seconds ago       122MB
aarch64/ubuntu      latest              5227400055a2        10 months ago       122MB
```

### Docker run image
```
MacBook-Pro-4:docker$ docker run -it base
root@03c887027644:/# ls
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@03c887027644:/# uname -a
Linux 03c887027644 4.9.49-moby #1 SMP Wed Sep 27 23:17:17 UTC 2017 aarch64 aarch64 aarch64 GNU/Linux
root@03c887027644:/# exit
exit
```

### Docker tag image and check
```
MacBook-Pro-4:docker$ docker tag a0bf9e42024a aauno/base:latest
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
aauno/base          latest              a0bf9e42024a        About a minute ago   122MB
base                latest              a0bf9e42024a        About a minute ago   122MB
aarch64/ubuntu      latest              5227400055a2        10 months ago        122MB
```

### Docker push image to hub
```
MacBook-Pro-4:docker$ docker push aauno/base
The push refers to a repository [docker.io/aauno/base]
833a9671002f: Mounted from aarch64/ubuntu 
61f2b5bd462f: Mounted from aarch64/ubuntu 
e594963dba4c: Mounted from aarch64/ubuntu 
e3b3fd908d6d: Mounted from aarch64/ubuntu 
b74547de2047: Mounted from aarch64/ubuntu 
latest: digest: sha256:47e1f5ed2c0fc29f5284ec375f4c49768a9165553c007982e611ee91431e40f0 size: 1357
```

### Docker clean all local images
```
MacBook-Pro-4:docker$ 
MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
aauno/base          latest              a0bf9e42024a        2 minutes ago       122MB
base                latest              a0bf9e42024a        2 minutes ago       122MB
aarch64/ubuntu      latest              5227400055a2        10 months ago       122MB

MacBook-Pro-4:docker$ docker rmi -f a0bf9e42024a 5227400055a2
Untagged: aauno/base:latest
Untagged: aauno/base@sha256:47e1f5ed2c0fc29f5284ec375f4c49768a9165553c007982e611ee91431e40f0
Untagged: base:latest
Deleted: sha256:a0bf9e42024a81a25e1eec2ccd35a11b52a848d697ec3659b7ca1c122b237b66
Untagged: aarch64/ubuntu:latest
Untagged: aarch64/ubuntu@sha256:e76f340967a53686298c57e4d388218652f01dc9b4905e8bd32b9d2bcbc4cfa4
Deleted: sha256:5227400055a23aa757c047d387d595d053e52398d4d866f80ae4e0f9357b3f35

MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

### Docker pull image from hub and check
```
MacBook-Pro-4:docker$ docker run aauno/base
Unable to find image 'aauno/base:latest' locally
latest: Pulling from aauno/base
8944e166ce98: Already exists 
1f8c28d8b7a9: Already exists 
9dbf9f348171: Already exists 
5cb9db57901b: Already exists 
7e21759f0cbf: Already exists 
Digest: sha256:47e1f5ed2c0fc29f5284ec375f4c49768a9165553c007982e611ee91431e40f0
Status: Downloaded newer image for aauno/base:latest

MacBook-Pro-4:docker$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
aauno/base          latest              a0bf9e42024a        4 minutes ago       122MB
```

### Docker run pulled image to check
```
MacBook-Pro-4:docker$ docker run -it aauno/base
root@6b3d3cb64421:/# uname -a
Linux 6b3d3cb64421 4.9.49-moby #1 SMP Wed Sep 27 23:17:17 UTC 2017 aarch64 aarch64 aarch64 GNU/Linux
root@6b3d3cb64421:/# exit
exit
MacBook-Pro-4:docker$ 
```

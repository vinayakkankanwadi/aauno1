Ref: http://collabnix.com/why-docker-19-03-on-nvidia-jetson-nano/


sudo apt install curl
curl -sSL https://get.docker.com/ | sh

  sudo usermod -aG docker xavier

xavier@xavier:~$ sudo docker version
Client: Docker Engine - Community
 Version:           19.03.5
 API version:       1.40
 Go version:        go1.12.12
 Git commit:        633a0ea
 Built:             Wed Nov 13 07:27:46 2019
 OS/Arch:           linux/arm64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.5
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.12
  Git commit:       633a0ea
  Built:            Wed Nov 13 07:26:16 2019
  OS/Arch:          linux/arm64
  Experimental:     false
 containerd:
  Version:          1.2.10
  GitCommit:        b34a5c8af56e510852c35414db4c1f4fa6172339
 runc:
  Version:          1.0.0-rc8+dev
  GitCommit:        3e425f80a8c931f88e6d94a8c831b9d5aa481657
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
xavier@xavier:~$ 


curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update


https://gist.github.com/JasonAtNvidia/e03e6675849d1d4049b85ea41efb2171#file-txdocker

Short Bash script to enable use of the GPU within a docker container running on an NVIDIA Jetson TX2. Place inside /usr/local/bin/, chmod +x txdocker, ensure it is in your system PATH, and use just as you would the docker command.
 txdocker


docker pull px4io/px4-dev-ros-melodic


export ROS_MASTER_URI=http://localhost:11311
export ROS_IP=192.168.0.15 172.17.0.1 
The Catkin Workspace has been created
Please modify the placeholders for ROS_MASTER_URI and ROS_IP placed into the file /home/xavier/.bashrc
to suit your environment.


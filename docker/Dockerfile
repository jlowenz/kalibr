FROM ros:indigo-perception-trusty
LABEL :name=":ros-indigo-kalibr"\
	:version="1.0"
# COMPONENT: :mirrors / 1.0
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
	DEBIAN_FRONTEND=noninteractive apt-get update

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install unzip

SHELL ["/bin/bash", "-c"]

# COMPONENT: :cppdev / 1.0
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install build-essential \
	cmake \
	curl \
	gdb \
	git \
	hashalot \
	mercurial \
	pkg-config \
	python \
	python-dev \
	wget

# COMPONENT: :python / 2.7
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install curl \
	python \
	python-dev

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get -y upgrade && \
	  apt-get -y install \  
    python-setuptools \
    python-rosinstall \
    ipython \
    libeigen3-dev \
    libboost-all-dev \
    doxygen \
    libopencv-dev \
    ros-indigo-vision-opencv \
    ros-indigo-image-transport-plugins \
    ros-indigo-cmake-modules \
    python-software-properties \
    software-properties-common \
    libpoco-dev \
    python-matplotlib \
    python-scipy \
    python-git \
    python-pip \
    ipython \
    libtbb-dev \
    libblas-dev \
    liblapack-dev \
    python-catkin-tools \
    libv4l-dev \
    udev \
    usbutils

RUN pip install python-igraph

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get -y upgrade && \
	  apt-get -y install \
    python-wxgtk2.8

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install python-pyx

# COMPONENT: :user-entry / 1.0
ADD user_entrypoint.sh /usr/bin/user_entrypoint.sh
ENTRYPOINT ["/usr/bin/user_entrypoint.sh"]

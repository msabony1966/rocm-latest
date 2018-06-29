
# Pull base image.
FROM ubuntu:latest


# Edit .bashrc file

RUN echo "# Don't save commands with leading space or duplicates " >> /root/.bashrc
RUN echo "HISTCONTROL=ignoredups:ignorespace" >> /root/.bashrc
RUN echo "# Append rather than overwrite" >> /root/.bashrc
RUN echo "shopt -s histappend" >> /root/.bashrc
RUN echo "# Save right after execution and reload it for sync" >> /root/.bashrc
RUN echo "# between multiple terminals" >> /root/.bashrc
RUN echo "PROMPT_COMMAND='history -a; history -n'" >> /root/.bashrc
RUN echo "# Lines of history in the shell" >> /root/.bashrc
RUN echo "HISTSIZE=20000" >> /root/.bashrc
RUN echo "# Lines of history in the histfile" >> /root/.bashrc
RUN echo "HISTFILESIZE=20000" >> /root/.bashrc
RUN echo "# Autocomplete command following sudo" >> /root/.bashrc
RUN echo "complete -cf sudo" >> /root/.bashrc
RUN echo "# Case insensitive search" >> /root/.bashrc
RUN echo "bind "set completion-ignore-case on"" >> /root/.bashrc

RUN echo 'export USER="root"' >> /root/.bashrc
RUN echo 'export DEBIAN_FRONTEND="noninteractive"' >> /root/.bashrc

RUN echo 'export AMDAPPSDKROOT="/opt/rocm/open"' >> /root/.bashrc
RUN echo 'export OPENCL_ROOT="/opt/rocm/opencl"' >> /root/.bashrc

RUN echo 'export PATH="/opt/rocm/bin:$PATH"' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH="/opt/rocm/lib:$LD_LIBRARY_PATH"' >> /root/.bashrc
RUN echo 'export PATH="/opt/rocm/opencl/bin/x86_64:$PATH"' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"' >> /root/.bashrc
RUN echo 'export PATH="/home/amd/work/amdovx-modules/build/bin:$PATH"' >> /root/.bashrc



# Install.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            nano tmux openssh-server \
            build-essential \
            sudo \
            libpci-dev \
            libelf-dev \
            build-essential \
            libnuma-dev && \
            rm -rf /var/lib/apt/lists/*




# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]


# How to run the image
#  sudo docker run -it --device=/dev/kfd --device=/dev/dri --group-add video --privileged --network host msabony1966/v1000-rocm-plus-4.17kernel /bin/bash
# 

FROM skysider/multiarch-docker

MAINTAINER tj <toconnor@fit.edu>

RUN apt-get -y update && apt-get -y install nano gcc-multilib zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t crunch

ENTRYPOINT ["/bin/zsh"]

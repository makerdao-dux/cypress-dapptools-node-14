# Extend cypress browsers node to use cypress
FROM cypress/browsers:node14.17.0-chrome91-ff89

RUN apt-get update && apt-get -y install sudo

## Create a maker user
RUN adduser maker --home /home/maker --disabled-password --gecos "" --shell /bin/sh && \
    echo "maker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/maker &&\
    chmod 0440 /etc/sudoers.d/maker

CMD /bin/sh -l
USER maker
ENV USER maker
WORKDIR /home/maker

# Install dapptools in the system
RUN sudo apt-get install bc
COPY ./setup-env.sh /home/maker
COPY ./install-dapptools.sh /home/maker
ENV PATH /home/maker/.local/bin:/home/maker/bin:${PATH}
RUN /home/maker/install-dapptools.sh
FROM cypress/browsers:node14.17.0-chrome91-ff89
RUN sudo apt-get install bc
COPY ./setup-env.sh /home/cypress
COPY ./install-dapptools.sh /home/cypress
ENV PATH /home/cypress/.local/bin:/home/cypress/bin:${PATH}
RUN /home/cypress/install-dapptools.sh
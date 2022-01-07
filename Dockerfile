FROM cypress/browsers:node14.17.0-chrome91-ff89
RUN sudo apt-get install bc
COPY ./setup-env.sh /home/circleci
COPY ./install-dapptools.sh /home/circleci
ENV PATH /home/circleci/.local/bin:/home/circleci/bin:${PATH}
RUN /home/circleci/install-dapptools.sh
FROM python:3.7
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -yq gcc
RUN curl -sSL https://get.docker.com/ | sh
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY quickstart.sh quickstart.sh
RUN svn export https://github.com/fetchai/agents-aea.git/trunk/examples
RUN svn export https://github.com/fetchai/agents-aea.git/trunk/scripts
RUN svn export https://github.com/fetchai/agents-aea.git/trunk/packages
CMD sh ./quickstart.sh

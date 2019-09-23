FROM jupyter/base-notebook:notebook-5.7.8
#
# Install icgc storage client into the base-notebook
#
USER root
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y libfuse-dev fuse curl wget software-properties-common

# Install java
RUN apt-get install -y openjdk-11-jre

# Install score
RUN mkdir -p /tmp/score-client && \
    cd /tmp/score-client && \
    wget -qO- https://artifacts.oicr.on.ca/artifactory/dcc-release/bio/overture/score-client/[RELEASE]/score-client-[RELEASE]-dist.tar.gz | \
    tar xvz --strip-components 1

# install samtools, etc.
RUN apt-get install -y samtools man locate vim net-tools

# Add the contents of our sudo access file into our notebook
ADD sudo.access /tmp/sudo.access
RUN cat /tmp/sudo.access >> /etc/sudoers
RUN rm /tmp/sudo.access

# The default setup creates a a directory called 'work'
# We don't need it, and it might confuse our users, so we'll delete it
# Run 'true' so that we don't fail when the directory doesn't already exist
RUN test -d work && rmdir work; true

# Automatically install a demo notebook, so that people have a clue about
# what jupyter notebooks are, and what they can do...
ADD --chown=jovyan:users *.ipynb ./
ADD --chown=jovyan:users *.tsv ./

RUN mv /tmp/score-client /home/jovyan/score-client
RUN mkdir ~jovyan/mydata
RUN mkdir ~jovyan/mydata/mnt
RUN echo 'function addPath { export PATH=$PATH:$1 ; }' >> ~jovyan/.bashrc
RUN echo 'addPath ~/score-client/bin' >> ~jovyan/.bashrc
RUN echo 'export STORAGE_PROFILE=collab' >> ~jovyan/.bashrc
RUN echo "alias score-mount='score-client mount --cache-metadata --mount-point mydata/mnt'" >> ~jovyan/.bashrc
RUN echo 'umask 077' >> ~jovyan/.bashrc
RUN rm -rf ~/.cache;mkdir ~/.cache
RUN chown -R jovyan:users /home/jovyan
USER jovyan

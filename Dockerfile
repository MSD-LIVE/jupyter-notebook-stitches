FROM ghcr.io/msd-live/jupyter/datascience-notebook:latest

USER root

RUN git clone https://github.com/JGCRI/stitches.git stitches
RUN pip install zarr==2.18.7 && conda install -c conda-forge zarr=2.18.7
RUN cd stitches && pip install .

# Now create a symlinked data folder inside the stitches package that links to /home/demo/data folder
# # RUN mkdir -p /bucket/data
# RUN mkdir -p /data
RUN rm -rf /opt/conda/lib/python3.11/site-packages/stitches/data

# using args as $DATA_DIR env doesn't seem to be set when the RUN ln -s is executed
# defaulting args to what it should be msdlive. For local containers, can be set in docker-compose.yml to point to the correct location
ARG DATADIR_ARG=/data

RUN ln -s $DATADIR_ARG/data /opt/conda/lib/python3.11/site-packages/stitches/data

COPY notebooks /home/jovyan/notebooks

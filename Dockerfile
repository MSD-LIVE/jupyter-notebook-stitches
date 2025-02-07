FROM ghcr.io/msd-live/jupyter/python-notebook:dev

USER root

RUN git clone https://github.com/JGCRI/stitches.git stitches
RUN cd stitches && pip install .

# Now create a symlinked data folder inside the stitches package that links to /home/demo/data folder
# RUN mkdir -p /bucket/data
RUN rm -rf /opt/conda/lib/python3.11/site-packages/stitches/data
RUN ln -s /data /opt/conda/lib/python3.11/site-packages/stitches/data

COPY notebooks /home/jovyan/notebooks
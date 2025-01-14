FROM jupyter/minimal-notebook:2022-05-03

USER root

RUN git clone https://github.com/JGCRI/stitches.git stitches
RUN cd stitches && pip install .

# Now create a symlinked data folder inside the stitches package that links to /home/demo/data folder
RUN mkdir -p /home/demo/data
RUN rm -rf /opt/conda/lib/python3.9/site-packages/stitches/data
RUN ln -s /home/demo/data /opt/conda/lib/python3.9/site-packages/stitches/data


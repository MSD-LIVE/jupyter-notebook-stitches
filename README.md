# MSD-LIVE Stitches Notebook

This repo contains the Dockerfile to build the notebook image as well as the notebooks
used in the MSD-LIVE deployment. It will rebuild the image and redeploy the notebooks
whenever changes are pushed to the main branch.

**The data folder is too big, so we are not checking this into github. You will have
to pull from s3 if you want to test locally**

## Testing the notebook locally

1. Get the data

   ```bash
   # make sure you are in the jupyter-notebook-stitches folder
   mkdir data
   cd data
   aws s3 cp s3://stitches-notebook-bucket/data . --recursive

   ```

2. Start the notebook via docker compose
   ```bash
   # make sure you are in the jupyter-notebook-stitches folder
   docker compose up
   ```


And this variable 
PROJECT (and set value to MSD-LIVE project slug like IM3 or GCIMS)

Current status:
Notebook not fully function, error running last cell of preparing-input-data.ipynb because it is trying to write to the read-only input data dir:

PermissionError                           Traceback (most recent call last)
Cell In[8], line 2
      1 # create and read in the metadata table
----> 2 stitches.make_pangeo_table()
      3 final_pangeo = archive = pd.read_csv(
      4     resources.files("stitches") / "data" / "pangeo_table.csv"
      5 )
      7 print(final_pangeo.head())

File /opt/conda/lib/python3.11/site-packages/stitches/make_pangeo_table.py:62, in make_pangeo_table()
     60 # Write the file out
     61 out_file = resources.files("stitches") / "data" / "pangeo_table.csv"
---> 62 final_pangeo_table.to_csv(out_file, index=False)

...

PermissionError: [Errno 13] Permission denied: '/opt/conda/lib/python3.11/site-packages/stitches/data/pangeo_table.csv'
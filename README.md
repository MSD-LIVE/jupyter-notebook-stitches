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

Notebook repos need to set these secrets (use *_uploader user to generate new access keys):  

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_S3_BUCKET
ORG_TOKEN_TO_ACCESS_JUPYTERPACKAGESINVENTORY_REPO (copy value fromm AWS secret store)

And this variable 
PROJECT (and set value to MSD-LIVE project slug like IM3 or GCIMS)
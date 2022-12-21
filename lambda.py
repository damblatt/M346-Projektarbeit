import boto3
import os
from PIL import Image
import pathlib
from io import BytesIO



s3 = boto3.resource('s3')





def create_this_bucket(name, location):
    try:
        s3.create_bucket(
            Bucket=name,
            CreateBucketConfiguration={
                'LocationConstraint': location
            }
        )
    except Exception as e:
        print(e)
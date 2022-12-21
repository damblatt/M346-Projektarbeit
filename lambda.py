import boto3
import os
from PIL import Image
import pathlib
from io import BytesIO

s3 = boto3.client('s3')

def resize_image(event):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    response = s3.get_object(Bucket=bucket, Key=key)
    image_content = response['Body'].read()
    image = Image.open(BytesIO(image_content))
    image.thumbnail((128, 128))

    s3.put_object(Bucket='target-bucket', Key=key, Body=image)
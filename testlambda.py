import boto3
import os
import sys
import uuid
from PIL import Image
import PIL.Image

s3_client = boto3.client('s3')

def resize_image(image_path, resized_path):
    with Image.open(image_path) as image:
        image.thumbnail((500, 500))
        image.save(resized_path)

def lambda_handler(event, context):
    #
    # giving a key error here event['Records']
    #
    for record in event['Records']: 
        bucket = 'mahabubelahibucket1'
        key = record['s3']['object']['key'] 
        download_path = '/tmp/{}{}'.format(uuid.uuid4(), key)
        upload_path = '/tmp/resized-{}'.format(key)

        s3_client.download_file(bucket, key, download_path)
        resize_image(download_path, upload_path)
        s3_client.upload_file(upload_path, 'mahabubelahibucket2', key)
import boto3
import os
from PIL import Image
import pathlib
from io import BytesIO

s3 = boto3.resource('s3')

def copy_to_other_bucket(src, des, key):
    try:
        copy_source = {
            'Bucket': src,
            'Key': key
        }
        bucket = s3.Bucket(des)
        bucket.copy(copy_source, key)
    except Exception as e:
        print(e)


def resize_image(src_bucket, des_bucket):
    size = 500, 500
    bucket = s3.Bucket(src_bucket)
    in_mem_file = BytesIO()
    client = boto3.client('s3')

    for obj in bucket.objects.all():
        file_byte_string = client.get_object(Bucket=src_bucket, Key=obj.key)['Body'].read()
        im = Image.open(BytesIO(file_byte_string))

        im.thumbnail(size, Image.ANTIALIAS)
        # ISSUE : https://stackoverflow.com/questions/4228530/pil-thumbnail-is-rotating-my-image
        im.save(in_mem_file, format=im.format)
        in_mem_file.seek(0)

        response = client.put_object(
            Body=in_mem_file,
            Bucket=des_bucket,
            Key='resized_' + obj.key
        )

def lambda_handler(event, context):
    bucket = s3.Bucket('m347-testbucketnr1')

    resize_image(bucket.name, 'm347-testbucketnr2')


    print(bucket)
import boto3
from PIL import Image

s3 = boto3.client('s3')

def resize_image(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    response = s3.get_object(Bucket=bucket, Key=key)
    image_content = response['Body'].read()
    image = Image.open(BytesIO(image_content))
    image.thumbnail((128, 128))
    
    s3.put_object(Bucket='target-bucket', Key=key, Body=image)
#!/home/codespace/.python/current/bin/python3

import urllib.request
import boto3

gif_url = 'https://media.istockphoto.com/id/2112190710/photo/woman-hugging-the-dog.jpg?s=612x612&w=is&k=20&c=9rWwBjLkC5gzydocIn7g03aQetJFu31KOgEpLwAGkiY='
local_file_name = 'script2_image.gif'

# Download the file
try:
    urllib.request.urlretrieve(gif_url, local_file_name)
    print(f"File downloaded successfully: {local_file_name}")
except Exception as e:
    print(f"Failed to download file: {e}")


s3 = boto3.client('s3')

bucket = 'ds2022-uqj5uw'
local_file = 'scrip2_image.gif'

resp = s3.put_object(
    Body = local_file,
    ACL = 'public-read',
    Bucket = bucket,
    Key = local_file
)

bucket_name = 'ds2022-uqj5uw'
object_key = 'script2_image.gif'
expires_in = 604800

def generate_presigned_url():
    try:
        response = s3.generate_presigned_url(
            'get_object',
            Params={'Bucket': bucket_name, 'Key': object_key},
            ExpiresIn=expires_in
        )
        return response
    except Exception as e:
        print(f'Failed to generate presigned URL: {e}')
        return None

if __name__ == "__main__":
    url = generate_presigned_url()
    if url:
        print(f'Presigned URL (expires in {expires_in} seconds): {url}')

answer = 'https://ds2022-uqj5uw.s3.amazonaws.com/script2_image.gif?AWSAccessKeyId=AKIAY6QVZAWJV5GHIZF2&Signature=Yh04Ho1WMBIg85yj2%2F9Y7dIN9ck%3D&Expires=1728159597'
print(answer)



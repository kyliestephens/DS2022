#!/bin/bash

curl https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2 > script_one_image.jpg

aws s3 cp script_one_image.jpg s3://ds2022-uqj5uw/

aws s3 presign --expires-in 604800 s3://ds2022-uqj5uw/script_one_image.jpg

URL="https://ds2022-uqj5uw.s3.amazonaws.com/script_one_image.jpg?AWSAccessKeyId=AKIAY6QVZAWJV5GHIZF2&Signature=OKIejWK4W%2FnGoiMy5rp%2BGWxDjAE%3D&Expires=1728152908"

echo $URL




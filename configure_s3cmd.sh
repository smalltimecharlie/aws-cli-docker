#!/bin/bash

sed -i config/s3cfg "s/{{{AWS_ACCESS_KEY}}}/$AWS_ACCESS_KEY_ID/g"
sed -i config/s3cfg "s/{{{AWS_SECRET_KEY}}}/$AWS_SECRET_ACCESS_KEY/g"

s3cmd --config=config/s3cfg

from flask import Flask
from flask import request
from datetime import datetime
import boto
import urllib
import json

app = Flask(__name__)

@app.route('/')
def data_ingest():

    station = request.args.get('stations')
    time = request.args.get('date')
    weather_date = datetime.strptime(time, '%m/%d/%Y %I:%M %p')
    s3_connection = boto.connect_s3(anon=True)
    return_url = "https://aws.amazon.com/noaa-big-data/nexrad/"
    s3_bucket = s3_connection.get_bucket('noaa-nexrad-level2',validate=False)
    timestamp = str(weather_date.year)+"/"+str("%02d"%weather_date.month)+"/"+str(weather_date.day)
    print('Data Injestor Invoked!!!')
    urls = ["http://noaa-nexrad-level2.s3.amazonaws.com/"+key.name for key in s3_bucket.get_all_keys(prefix=timestamp)]
    return json.dumps(urls)
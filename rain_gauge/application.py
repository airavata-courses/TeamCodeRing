from flask import Flask
from flask import request
from datetime import datetime
import urllib

app = Flask(__name__)

@app.route('/')
def data_ingest():
    station = request.args.get('stations')
    time = request.args.get('date')
    weather_date = datetime.strptime(time, '%m/%d/%Y %I:%M %p')
    return_url = "https://aws.amazon.com/noaa-big-data/nexrad/"
    return_url += str(weather_date.year)+"/"+str(weather_date.month)+"/"+str(weather_date.day)+"/"+urllib.quote(station)+"/"
    print('Data Injestor Invoked!!!')
    return return_url
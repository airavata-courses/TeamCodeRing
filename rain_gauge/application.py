from flask import Flask
app = Flask(__name__)

@app.route('/')
def data_ingest():
    return 'Data Injestor Invoked!!!'
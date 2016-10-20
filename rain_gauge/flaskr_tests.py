import os
import application
import unittest
import tempfile
import flask
from datetime import datetime

class FlaskrTestCase(unittest.TestCase):

    def setUp(self):
        self.app = application.app.test_client()
        self.app.testing = True


    def test_data_ingest_true(self):
        #result = self.app.get('/')
        #self.assertEqual(result.status_code, 200)
        # #date = datetime.strptime('02%2F05%2F2013+5%3A12+PM', '%m/%d/%Y %I:%M %p')
        rv = self.app.get('/?stations=Albuquerque&date=02/06/2012 10:01 AM')
        #print (str(rv))
        assert 'https://aws.amazon.com/noaa-big-data/nexrad/2012/2/6/Albuquerque/' in rv.data 
        #assert len(rv.data) > 1

    def test_connection(self):
        result = self.app.get('/')
        self.assertEqual(result.status_code, 500)

    def test_data_ingest_false(self):
        #result = self.app.get('/')
        #self.assertEqual(result.status_code, 200)
        # #date = datetime.strptime('02%2F05%2F2013+5%3A12+PM', '%m/%d/%Y %I:%M %p')
        rv = self.app.get('/?stations=Albuquerque&date=02/06/2012 10:01 AM')
        #print (str(rv))
        assert 'https://aws.amazon.com/noaa-big-data/nexrad/2012/2/6/SanFransisco/' not in rv.data 
        
if __name__ == '__main__':
    unittest.main()
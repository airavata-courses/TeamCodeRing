var express = require('express');
var redis = require('redis');
var router = express.Router();
var client = redis.createClient(6379, "redis");

var app = express();

/* GET home page. */
router.get('/', function(req, res, next) {
  client.smembers('weather_machine', function(err, reply) {
    var tab = "<table>";
    for(var i = 0;i<reply.length;i++) {
      tab += "<tr><td>"+reply[i]+"</td>";
      client.smembers(reply[i], function(err, response) {
        for(var j = 0;j<response.length;j++) {
          console.log("inside second loop");
          console.log(response);
          tab += "<td>"+response[j]+"</td>";
        }
      });
      tab += "</tr>";
    }
    tab += "</table>";
    console.log(tab);
    setTimeout(function() {res.render('index.ejs', {tab})}, 500);
  });
});

module.exports = router;

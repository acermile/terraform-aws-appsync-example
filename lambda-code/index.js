var https = require('https');


exports.handler = function (event, context, callback){


  console.log("Received event {}", JSON.stringify(event, 1));
  var amount = JSON.stringify(event.amount, 1);
  console.log("initial amount" + amount);
  var apiKey = '1513e2d7305b3b4b0710';

var  fromCurrency = JSON.stringify(event.fromCurrency, 1).replace(/['"]+/g, '');
 var toCurrency = JSON.stringify(event.toCurrency, 1).replace(/['"]+/g, '');
  var query = fromCurrency + '_' + toCurrency;

  var url = 'https://free.currconv.com/api/v7/convert?q='+query+'&compact=ultra&apiKey=' + apiKey;
  console.log(url);

  https.get(url, function(res){
      var body = '';

      res.on('data', function(chunk){
          body += chunk;
      });

      res.on('end', function(){
          try {
            var jsonObj = JSON.parse(body);
            console.log(jsonObj);
            var val = jsonObj[query];
            console.log(val);
            if (val) {
              var total = val * amount;
              console.log(total);
              amount = Math.round(total * 100) / 100;
              callback(null, amount);

            } else {
              var err = new Error("Value not found for " + query);
              console.log(err);
              callback(err);
            }
          } catch(e) {
            console.log("Parse error: ", e);
            callback(e);
          }
      });
  }).on('error', function(e){
        console.log("Got an error: ", e);
        callback(e);
  });


//uncomment to test



/*convertCurrency(1000, 'INR', "USD", function(err, amount) {
  console.log(amount);
  //return amount ;
});*/

}

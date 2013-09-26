var express = require('express')
  , app = express();

app.use(express.static(__dirname));

app.listen(process.env.PORT || 5000, function () {
  console.log('express server started.');
});

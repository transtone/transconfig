var page = require('webpage').create();
page.onConsoleMessage = function(msg) {
  console.log('Page title is ' + msg);
};
var url='http://baidu.com/'
page.open(url, function(status) {
  page.evaluate(function() {
    console.log(document.title);
  });
});

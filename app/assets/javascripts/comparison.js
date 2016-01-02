$(document).on('page:load ready',function(){
  isAnalyticsPage
});

function isAnalyticsPage(self){
  debugger;
  var url = self.URL.split('/')
  var length = url.length
  var analytics = url[length-1]
  return (analytics == "comparison")
}

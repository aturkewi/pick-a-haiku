$(document).on('page:load ready',function(){
  if (isComparisonPage(this)){
    $.getJSON('/haikus/comparison', function(data){
      debugger;
    })
  }
});

function isComparisonPage(self){
  var url = self.URL.split('/')
  var length = url.length
  var analytics = url[length-1]
  return (analytics == "comparison")
}

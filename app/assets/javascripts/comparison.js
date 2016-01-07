$(document).on('page:load ready',function(){
  if (isComparisonPage(this)){
    $.getJSON('/haikus/comparison', function(haikus){
      addHaikus(haikus);
    })
  }
});

function addHaikus(haikus){
  haikus.forEach(function(haiku){
    addHaiku(haiku);
  });
  getHaikuListener();
}

function getHaikuListener(){
  $('.get-haikus').on('ajax:success',function(event, data, status, xhr){
    $('#compare_haikus').html('');
    addHaikus(data);
  })
}

function addHaiku(haiku){
  var source = $('#haiku-template').html();
  var template = Handlebars.compile(source);
  var haiku_html = template(haiku);
  $('#compare_haikus').append(haiku_html);

}

function isComparisonPage(self){
  var url = self.URL.split('/')
  var length = url.length
  var analytics = url[length-1]
  return (analytics == "comparison")
}

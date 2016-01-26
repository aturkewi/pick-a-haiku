$(document).on('page:load ready',function(){
  if (isComparisonPage(this)){
    $.getJSON('/haikus/comparison', function(haikus){
      addHaikus(haikus);
    })
  }
});

function getLastElementOfUrl(url){
  var urlArray = url.split('/')
  var length = urlArray.length
  return urlArray[length-1]
}

function addHaikus(haikus){
  haikus.forEach(function(haiku){
    addHaiku(haiku);
  });
  getHaikuListener();
  favoriteListener();
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
  addFavoriteIcon(haiku)
}


function isComparisonPage(self){
  // var last_word = getLastElementOfUrl(self.URL)
  var location = new PathParser();
  location.init(self.URL);
  return (location.getLastElement() == "comparison");
}

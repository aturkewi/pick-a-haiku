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

function addFavoriteIcon(haiku){
  var haikuTitle = $(".haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img src='/heart-favorited.png'>");
  }else{
    haikuTitle.append("<img src='/heart-non-favorited.png'>");
  }
}

function addHaiku(haiku){
  var source = $('#haiku-template').html();
  var template = Handlebars.compile(source);
  var haiku_html = template(haiku);
  $('#compare_haikus').append(haiku_html);
  addFavoriteIcon(haiku)
}

function isComparisonPage(self){
  var url = self.URL.split('/')
  var length = url.length
  var analytics = url[length-1]
  return (analytics == "comparison")
}

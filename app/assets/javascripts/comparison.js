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

function favoriteListener(){
  $('.favorite').on('click', function(e){
    var heart = getLastElementOfUrl(this.src);
    var haikuId = this.parentElement.className.split('-')[1]
    if (heart == "heart-non-favorited.png"){
      addToFavorites(haikuId);
    }else{
      removeFromFavorites(haikuId);
    }
  })
}

function addFavoriteIcon(haiku){
  var haikuTitle = $(".haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img class='favorite' src='/heart-favorited.png'>");
  }else{
    haikuTitle.append("<img class='favorite' src='/heart-non-favorited.png'>");
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
  var last_word = getLastElementOfUrl(self.URL)
  return (last_word == "comparison")
}

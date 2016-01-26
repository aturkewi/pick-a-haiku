$('page:load ready',function(){
// $(".haikus.comparison").ready(function(){
  // return alert('i am on the comparison page')
  $.getJSON('/haikus/comparison', function(haikus){
    addHaikus(haikus);
  })
});

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

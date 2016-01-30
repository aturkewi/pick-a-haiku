$('page:load ready',function(){
  favoriteListener()
});

function removeFavoriteFromDom(favoriteLi){
  favoriteLi.parentElement.remove()
}

function favoriteListener(){
  $('img.favorite').on('click', function(e){
    sendFavoriteRequest(this, removeFavoriteFromDom);
    // removeFavoriteFromDom(this);
  })
}

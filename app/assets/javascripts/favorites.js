function favoriteListener(){
  $('img.favorite').on('click', function(e){
    debugger;
  })
}

function toggleFavorite(){

}

function addToFavorites(haikuId){
  $.post("/favorites/" + haikuId,function(){

  })
}

function removeFromFavorites(haikuId){

}

function addFavoriteIcon(haiku){
  var haikuTitle = $(".haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img class='heart-favorited favorite'/>");
  }else{
    haikuTitle.append("<a class='heart-non-favorited favorite'></a>");
  }
}

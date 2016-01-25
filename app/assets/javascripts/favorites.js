function favoriteListener(){
  $('img.favorite').on('click', function(e){
    var heart = getLastElementOfUrl(this.src);
    var haikuId = this.parentElement.className.split('-')[1]
    if (heart == "heart-non-favorited.png"){
      addToFavorites(haikuId);
    }else{
      removeFromFavorites(haikuId);
    }
  })
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
    haikuTitle.append("<img class='favorite' src='/heart-favorited.png'>");
  }else{
    haikuTitle.append("<img class='favorite' src='/heart-non-favorited.png'>");
  }
}

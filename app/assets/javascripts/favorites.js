function favorited(heart){
  return (heart.className.indexOf('heart-favorited') != -1);
}

function getHaikuId(heart){
  return heart.parentElement.id.split('-')[1];
}

function sendFavoriteRequest(heart){
  var haikuId = getHaikuId(heart);
  if (favorited(heart)){
    removeFromFavorites(haikuId);
  }else{
    addToFavorites(haikuId);
  }
}

function toggleFavorite(heart){
  if (favorited(heart)){
    $(heart).removeClass('heart-favorited');
    $(heart).addClass('heart-non-favorited');
  }else{
    $(heart).removeClass('heart-non-favorited');
    $(heart).addClass('heart-favorited');
  }
}

function addToFavorites(haikuId){
  $.post("/favorites/" + haikuId,function(){
    // flass message?
  })
}

function removeFromFavorites(haikuId){
  $.ajax({
      url: '/favorites/'+haikuId,
      type: 'DELETE',
      success: function() {
        // flash message?
      }
  });
}

function addFavoriteIcon(haiku){
  var haikuTitle = $("#haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img class='heart-favorited favorite'/>");
  }else{
    haikuTitle.append("<img class='heart-non-favorited favorite'/>");
  }
}

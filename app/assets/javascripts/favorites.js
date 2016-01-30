function favorited(heart){
  return (heart.className.indexOf('heart-favorited') != -1);
}

function getHaikuId(heart){
  return heart.parentElement.id.split('-')[1];
}

function sendFavoriteRequest(heart, completeOnDelete){
  var haikuId = getHaikuId(heart);
  if (favorited(heart)){
    return removeFromFavorites(haikuId, completeOnDelete, heart);
  }else{
    return addToFavorites(haikuId, heart);
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

function addToFavorites(haikuId, heart){
  $.post("/favorites/" + haikuId,function(requestSuccess){
    toggleFavorite(heart)
  })
  .fail(function(data){
    alert("You must be logged in to perform this action.");
  })
}

function removeFromFavorites(haikuId, completeOnDelete, heart){
  $.ajax({
      url: '/favorites/'+haikuId,
      type: 'DELETE',
      success: completeOnDelete(heart)
  })
}

function addFavoriteIcon(haiku){
  var haikuTitle = $("#haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img class='heart-favorited favorite'/>");
  }else{
    haikuTitle.append("<img class='heart-non-favorited favorite'/>");
  }
}

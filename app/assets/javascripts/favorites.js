function favorited(heart){
  return (heart.className.indexOf('heart-favorited') != -1);
}

function getHaikuId(heart){
  return heart.parentElement.id.split('-')[1];
}

function sendFavoriteRequest(heart){
  var haikuId = getHaikuId(heart);
  if (favorited(heart)){
    return removeFromFavorites(haikuId);
  }else{
    return addToFavorites(haikuId);
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
  var success = true
  $.post("/favorites/" + haikuId,function(){
  })
  .fail(function(data){
    alert("You must be logged in to perform this action.");
    var success = false;
  })
  return success;
}

function removeFromFavorites(haikuId){
  $.ajax({
      url: '/favorites/'+haikuId,
      type: 'DELETE',
      success: function() {
        // flash message?
        success = true
      }
  })
  return true
}

function addFavoriteIcon(haiku){
  var haikuTitle = $("#haiku-"+haiku.id)
  if (haiku.favorited){
    haikuTitle.append("<img class='heart-favorited favorite'/>");
  }else{
    haikuTitle.append("<img class='heart-non-favorited favorite'/>");
  }
}

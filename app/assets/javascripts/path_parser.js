function PathParser(){}

PathParser.prototype.init = function(url){
  this.url = url;
}

PathParser.prototype.getLastElement = function(){
  var urlArray = this.url.split('/');
  var length = urlArray.length;
  return urlArray[length-1]
}

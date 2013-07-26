function Photo(json){
  this.link = json.link;
  this.id = json.id;
  this.user_id = json.user_id;
}

Photo.all = function(user_id){
  var that = this;
  var baseUrl =  "/users/" + user_id + "/photos.json"
   $.ajax( {
    url: baseUrl,
    dataType: "json",
    data: {photo: {link: that.link,
                   user_id: that.user_id}},
    success: function(photoData){
      var all = [];
      for(var i=0; i < photoData.length; i++){
        console.log(photoData);
        all.push(new Photo(photoData[i]));
      }
      return all;
    }

  });
}

Photo.find = function(id){
  var id = id
  var all = Photo.all;
  return  _.select(all, function(photo){
    return photo.id == id
  });
}



Photo.prototype.save = function(){
  if(this.id){
    this.update();
  }
  else{
    this.create();
  }
}

Photo.prototype.create = function(){
  var that = this;
  //post request
  //AJAX request
  var baseUrl =  "/users/" + this.user_id + "photos"
   $.ajax( {
    url: baseUrl,
    type: "POST",
    data: {photo: {link: that.link,
                   user_id: that.user_id}},
    success: function(photoData){
      that.id = photoData.id }
      //insert photo into dom??
  } );
}

Photo.prototype.update = function(){
  //put request
  //AJAX request
  var baseUrl =  "/users/" + this.user_id + "photos"
   $.ajax({
    url: baseUrl,
    type: "PUT",
    data: {photo: {link: that.link,
                   user_id: that.user_id}}
  });
};
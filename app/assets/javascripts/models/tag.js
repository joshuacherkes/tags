function Tag(json){
  this.photo_id = json.photo_id
  this.friend_id = json.friend_id
}

Tag.prototype.save = function(){
  if(this.id){
    this.update();
  }
  else{
    this.create();
  }
}

Tag.prototype.create = function(){

  var that = this;

  var baseUrl =  "/photos/" + this.photo_id + "tags"
   $.ajax({
     url: baseUrl,
    type: "POST",
    data: {tag: {photo_id: that.photo_id,
                   friend_id: that.friend_id}},
    success: function(tagData){
      that.id = tagData.id }
      //Somewhere here insert the tag into the dom.
  } );



}

Tag.prototype.update = function(){
  var that = this;

  var baseUrl =  "/photos/" + this.photo_id + "tags"
   $.ajax({
     url: baseUrl,
    type: "PUT",
    data: {tag: {photo_id: that.photo_id,
                   friend_id: that.friend_id}},
    success: function(tagData){
      //Somewhere here insert the tag into the dom.
    }
  });
}

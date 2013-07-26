class Tag < ActiveRecord::Base
  attr_accessible :photo_id, :friend_id

  belongs_to :photo
  belongs_to :user, :foreign_key => :friend_id


end
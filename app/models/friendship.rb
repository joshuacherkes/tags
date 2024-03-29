class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id

  belongs_to :user, :class_name =>  "User", :foreign_key => :user_id
  belongs_to :friend, :class_name =>  "User", :foreign_key => :friend_id

end
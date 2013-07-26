class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password


  validates :username, :password_digest, :presence => true

  has_many :friendships, :class_name =>  "Friendship", :foreign_key => :user_id

  has_many :stalks, :class_name => "Friendship", :foreign_key => :friend_id

  has_many :friends, :through => :friendships,
           :class_name => "User", :foreign_key => :user_id

  has_many :stalkers, :through => :stalks,
           :class_name => "User", :foreign_key => :friend_id,
           :source => :user

  has_many :photos

  has_many :tags, :foreign_key => :friend_id

  has_many :tagged_photos, :through => :tags, :class_name => "Photo",
  :foreign_key => :photo_id



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

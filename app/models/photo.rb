class Photo < ActiveRecord::Base
  attr_accessible :user_id, :link
  belongs_to :user
  has_many :tags





end
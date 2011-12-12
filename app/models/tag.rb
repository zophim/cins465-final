class Tag < ActiveRecord::Base
  has_many :topics, :class_name => "topic", :foreign_key => "tag_id"
  has_many :posts,  :class_name => "post",  :foreign_key => "tag_id"
  
  validates :word, :presence => true
  
end

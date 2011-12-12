class Op < ActiveRecord::Base
  belongs_to :user,  :class_name => "User",  :foreign_key => "user_id"
  belongs_to :forum, :class_name => "Forum", :foreign_key => "forum_id"
  
  validates :user_id,  :presence => true
  validates :forum_id, :presence => true
end

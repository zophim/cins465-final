class Post < ActiveRecord::Base
  belongs_to :user,  :class_name => "User",  :foreign_key => "user_id"
  belongs_to :topic, :class_name => "Topic", :foreign_key => "topic_id"
  belongs_to :tag,   :class_name => "Tag",   :foreign_key => "tag_id"

  validates :body,     :presence => true
  
  validates :user_id,  :presence => true
  
  validates :topic_id, :presence => true
  
end

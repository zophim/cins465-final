class Topic < ActiveRecord::Base
  belongs_to :user,  :class_name => "User",  :foreign_key => "user_id"
  belongs_to :forum, :class_name => "Forum", :foreign_key => "forum_id"
  belongs_to :tag,   :class_name => "Tag",   :foreign_key => "tag_id"
  
  has_many   :posts, :class_name => "post",  :foreign_key => "topic_id", :dependent => :destroy
  
  serialize :tag_id
  
  validates :title,    :presence => true,
                       :length   => {:maximum => 50}
                    
  validates :user_id,  :presence => true
  
  validates :forum_id, :presence => true
  
end

class Forum < ActiveRecord::Base
  
  has_many :topics, :class_name => "topic", :foreign_key => "forum_id", :dependent => :destroy
  
  belongs_to :op, :class_name => "Op", :foreign_key => "op_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :group, :class_name => "Group", :foreign_key => "group_id"
  
  serialize :op_id
  
  validates :title,   :presence     => true,
                      :length       => {:maximum => 50},
                      :uniqueness   => true
                    
  validates :user_id, :presence => true
  
end

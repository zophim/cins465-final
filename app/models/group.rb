class Group < ActiveRecord::Base
  has_many :forums, :class_name => "forum", :foreign_key => "group_id"
  has_many :users,  :class_name => "user",  :foreign_key => "group_id"
  
  validates :name, :presence     => true,
                   :uniqueness   => true
end

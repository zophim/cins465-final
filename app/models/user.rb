class User < ActiveRecord::Base
  has_many   :forums, :class_name => "forum", :foreign_key => "user_id", :dependent => :destroy
  has_many   :topics, :class_name => "topic", :foreign_key => "user_id", :dependent => :destroy
  has_many   :posts,  :class_name => "post",  :foreign_key => "user_id", :dependent => :destroy
  belongs_to :group,  :class_name => "Group", :foreign_key => "group_id"
  
  serialize :group_id, :email
  
  attr_accessor :password
  attr_accessible :first_name, :last_name, :user_name, :phone, :DOB, :active, :hide_vulgar, :email, :group_id
  
  before_save :encrypt_password
  
  validates :first_name, :presence => true,
                         :length   => {:maximum => 50}
  
  validates :last_name,  :presence => true,
                         :length   => {:maximum => 50}
                         
  validates :username,   :presence   => true,
                         :uniqueness => true,
                         :length     => {:maximum => 50}

  validates :DOB,        :presence => true
  
  validates :password,   :presence      => true,
                         :confirmation  => true,
                         :length        => {:minimum => 6}
                         
  validates :email,      :format   => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  private

      def encrypt_password
        self.salt = make_salt unless has_password?(password)
        self.encrypted_password = encrypt(password)
      end

      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end

      def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
      end

      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end
      


end

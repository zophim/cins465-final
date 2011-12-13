class User < ActiveRecord::Base
  has_many   :forums, :class_name => "forum", :foreign_key => "user_id", :dependent => :destroy
  has_many   :topics, :class_name => "topic", :foreign_key => "user_id", :dependent => :destroy
  has_many   :posts,  :class_name => "post",  :foreign_key => "user_id", :dependent => :destroy
  has_many   :ops,    :class_name => "op",    :foreign_key => "user_id", :dependent => :destroy
  belongs_to :group,  :class_name => "Group", :foreign_key => "group_id"
  
  serialize :group_id
  serialize :email
  
  before_save :check_admin
  
  attr_accessor :password, :admin_pass
  attr_accessible :first_name, :last_name, :username, :phone, :password, :DoB, :admin_pass, :active, :hide_vulgar, :email, :group_id
  
  validates :first_name, :presence => true,
                         :length   => {:maximum => 50}
  
  validates :last_name,  :presence => true,
                         :length   => {:maximum => 50}
  
  validates :username,   :presence   => true,
                         :uniqueness => true,
                         :length     => {:maximum => 50}
  
  validates :DoB,        :presence => true
  
  validates :password,   :presence      => true,
                         :confirmation  => true,
                         :length        => {:minimum => 6}
  
  validates :email,      :format   => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(username, submitted_password)
    if username == "/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i"
      user = find_by_email(username)
    else
      user = find_by_username(username)
    end
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  def encrypting
    encrypt_password
  end
  
  private
  
    def check_admin
      if admin_pass == "password"
        self.admin = true
      else
        self.admin = false
      end
    end
    
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

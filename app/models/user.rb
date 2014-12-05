class User < ActiveRecord::Base
  attr_accessible :name, :password, :shop_no, :uid, :user_id
  #Validate
  validates :name, :password, :user_id, :uid, :presence => true
  validates :name, :password, :length => { :minimum => 6, :maximum => 18 }
  validates :password, :user_id, :uniqueness => true
  validates :uid, :length => { :is => 13,  :message => "UID must be 13" }
  validates :shop_no, :length => { :is => 4 }
  validates :user_id, :length => { :is => 12 }
  def self.login(user_id,password)
    user = User.find_by_user_id_and_password(user_id,password)
    if user
    return user
    else
      return nil
    end
  end
end

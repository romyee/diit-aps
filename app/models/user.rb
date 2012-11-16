require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :contact_number, :email, :first_name, :hashed_password, :last_name, :official_id, :permanent_address, :present_addresss, :recover_hash, :role, :salt_key, :status, :password
  has_many :refferdeds, :class_name => "ApplicationProcess", :foreign_key => :reffer_to_id
  
  validates_presence_of :first_name, :email, :official_id, :present_addresss, :contact_number
  validates_uniqueness_of :email
  attr_accessor :password
  
  validates_length_of :password, :within => 8..25, :on => :create
  before_save :create_hashed_passowrd
  #after_save :clear_password
  after_create :send_notification
  
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def self.make_salt(email = "")
    Digest::SHA1.hexdigest("use #{email} with #{Time.now} to make salt")
  end
  
  def self.hashed_password_with_salt( password = "", salt_key)
    Digest::SHA1.hexdigest("mix the #{salt_key} with #{password} for extra security")
  end
  
  def password_match?(password = "")
    hashed_password == User.hashed_password_with_salt(password, salt_key)
  end
  
  def self.authenticate(email, password)
    user = User.where(:email => email)
    
    if user.size > 0 && user.first.password_match?(password)
      return user.first
    else
      return false
    end
  end
  
  
  
  private
  def create_hashed_passowrd
    unless password.blank?
      self.salt_key = User.make_salt(email) if salt_key.blank?
      self.hashed_password = User.hashed_password_with_salt(password, salt_key)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
  def send_notification
    Notifications.signup(self).deliver
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  validates :name, presence: true, length: { maximum: 50 }

  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }



  has_many :microposts, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  
  before_save :create_remember_token

  def feed
    Micropost.where("user_id = ? ", id)
  end

  private 
    
      def create_remember_token
          self.remember_token = SecureRandom.urlsafe_base64
      end
end

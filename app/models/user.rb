class User < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
end

private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


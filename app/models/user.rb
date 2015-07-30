class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_secure_password
end

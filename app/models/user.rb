class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :employees, dependent: :destroy
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true
end

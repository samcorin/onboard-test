class Employee < ApplicationRecord
  # belongs_to :manager
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  after_create :send_admin_mail

  def send_admin_mail
    # UserMailer.send_new_user_message(self).deliver
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments, as: :posting
  before_save :format_mail
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  # alternative: validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } Devise.email_regexp

  private

  def format_mail
    self.email = email.downcase
  end
end

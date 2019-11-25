# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 140, maximum: 500 }
end

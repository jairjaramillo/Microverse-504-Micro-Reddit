class Comment < ApplicationRecord
  belongs_to :posting, polymorphic: true

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true, length: { maximum: 500 }
end

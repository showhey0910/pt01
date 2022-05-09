class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 140 }

end

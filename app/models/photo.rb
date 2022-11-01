class Photo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true

  has_one_attached :image
end
class Photo < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true

  has_one_attached :image

  def url
    url_for(image)
  end
end
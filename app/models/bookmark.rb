class Bookmark < ApplicationRecord
  belongs_to :group

  has_one_attached :favicon do |icon|
    icon.variant :png, convert: "png"
  end

  validates :label, presence: true
  validates :url, presence: true
end

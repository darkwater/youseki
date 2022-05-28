class Bookmark < ApplicationRecord
  belongs_to :group

  validates :label, presence: true
  validates :url, presence: true
end

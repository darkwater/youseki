class Group < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
end

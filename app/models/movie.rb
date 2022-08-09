class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :delete_all

  validates :title, :overview, uniqueness: true
  validates :title, :overview, presence: true
end

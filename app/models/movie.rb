class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  has_many :bookmarks
  #has_many :lists, through: :bookmarks

  before_destroy :check_bookmark_presence

  private

  def check_bookmark_presence
    return false if self.bookmarks.count > 0
  end
end

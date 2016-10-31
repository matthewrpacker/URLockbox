class Link < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :url, url: true
end

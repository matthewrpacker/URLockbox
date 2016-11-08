class Link < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :url, url: true

  def status
    self.read ? "Mark as Unread" : "Mark as Read"
  end

  def type
    self.read ? "read" : "unread"
  end
end

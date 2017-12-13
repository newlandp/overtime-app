class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }

  def self.posts_by(user)
    includes(:user).where(user_id: user.id)
  end
end

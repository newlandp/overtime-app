class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale

  def self.posts_by(user)
    includes(:user).where(user_id: user.id)
  end
end

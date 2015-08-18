class Question < ActiveRecord::Base
  belongs_to :user
  has_one :solution
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
end

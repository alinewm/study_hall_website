class Question < ActiveRecord::Base
  belongs_to :user
  has_one :solution
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate  :picture_size
  validate :enough_question_balance

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB") #this never shows up
    end
  end

  def enough_question_balance
    if self.user.question_balance < 1
      errors.add(:question_balance, "is not enough")
    end
  end


end

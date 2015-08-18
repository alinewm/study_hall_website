class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :solutions, dependent: :destroy

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def feed
    if current_user.admin?
      Question.all
    else
      questions
      #here we'd have to pull each question with it's associated solution...
    end
  end
end

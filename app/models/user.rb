class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :solutions, dependent: :destroy
  validates :password, length: { minimum: 8 }, unless: "password.nil?"
  validates :password, presence: true, if: "id.nil?"
  validates :name, presence: true

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_question_balance, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def set_default_question_balance
    self.question_balance ||= 5
  end

  def User.update_question_balance
    User.update_all question_balance = 5
  end

  def use_question!
    self.question_balance -= 1
    save
  end

  def feed
    if admin?
      Question.all
    else
      questions
      #here we'd have to pull each question with it's associated comment...
    end
  end
end

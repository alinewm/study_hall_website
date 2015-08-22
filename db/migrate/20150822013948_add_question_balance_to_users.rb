class AddQuestionBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_balance, :integer
  end
end

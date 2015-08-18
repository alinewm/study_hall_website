class AddStudentSpecificFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :school, :string
    add_column :users, :birthday, :datetime
    add_column :users, :grade, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end

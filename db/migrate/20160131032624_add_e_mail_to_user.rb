class AddEMailToUser < ActiveRecord::Migration
  def change
    unless column_exists? :users, :email
      add_column :users, :email, :string
    end
  end
end

class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acct_type, :string
  end
end

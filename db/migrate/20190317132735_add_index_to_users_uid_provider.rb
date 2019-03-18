class AddIndexToUsersUidProvider < ActiveRecord::Migration[5.1]
  def change
    add_index :users, [:uid, :provider], unique: true
  end
end

class AddIndexToUsersUidProvider < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
    add_index :users, [:uid, :provider], unique: true
  end
end

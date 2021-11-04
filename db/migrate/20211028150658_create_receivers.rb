class CreateReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :receivers do |t|
      t.belongs_to :private_message
      t.belongs_to :user
      t.timestamps
    end
  end
end

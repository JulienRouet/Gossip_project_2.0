class CreateSubComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_comments do |t|
      t.text :content
      t.belongs_to :comment
      t.belongs_to :user
      t.timestamps
    end
  end
end

class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :topic_id
      t.integer :user_id
      t.string :comment
      t.integer :rating

      t.timestamps null: false
    end
  end
end

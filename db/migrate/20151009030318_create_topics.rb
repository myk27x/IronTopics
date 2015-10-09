class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :description
      t.string   :focus

      t.timestamps null: false
    end
  end
end

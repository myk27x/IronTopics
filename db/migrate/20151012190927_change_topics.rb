class ChangeTopics < ActiveRecord::Migration
  def change
    change_column :topics, :description, :text
  end
end

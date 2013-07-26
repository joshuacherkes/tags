class AddTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :photo_id
      t.integer :friend_id
    end
  end
end

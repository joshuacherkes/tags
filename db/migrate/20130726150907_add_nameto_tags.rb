class AddNametoTags < ActiveRecord::Migration
  def change
    add_column :tags, :name, :string
  end
end

class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original_url
      t.string :custom_url
      t.integer :times_visited, :default => 1

      t.timestamps null: false
    end
  end
end

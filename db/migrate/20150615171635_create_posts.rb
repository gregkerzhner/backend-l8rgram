class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :user_id
      t.datetime :scheduled_date
      t.timestamps null: false
    end

    add_attachment :posts, :media
  end
end

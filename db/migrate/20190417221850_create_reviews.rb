class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating
      t.integer :destination_id
      t.integer :user_id
    end
  end
end

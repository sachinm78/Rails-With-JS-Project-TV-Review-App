class CreateNewReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :show, index: true, foreign_key: true
      t.integer :rating, default: 0
      t.string :comment, default: "Add a comment."

      t.timestamps
    end
  end
end

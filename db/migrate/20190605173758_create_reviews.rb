class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :show, index: true, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end

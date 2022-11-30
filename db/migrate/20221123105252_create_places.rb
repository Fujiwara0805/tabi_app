class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

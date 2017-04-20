class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end

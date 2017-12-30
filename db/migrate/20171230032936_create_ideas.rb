class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.text :about
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

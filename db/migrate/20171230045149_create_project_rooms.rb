class CreateProjectRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :project_rooms do |t|
      t.references :idea, foreign_key: true
      t.references :engineer, foreign_key: true
      t.date :deadline
      t.text :about
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

class CreateProjectComments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_comments do |t|
      t.references :project_room, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

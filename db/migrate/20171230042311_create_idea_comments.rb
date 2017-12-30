class CreateIdeaComments < ActiveRecord::Migration[5.0]
  def change
    create_table :idea_comments do |t|
      t.references :idea, foreign_key: true
      t.text :content
      t.integer :comment_type, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

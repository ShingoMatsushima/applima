class CreateEngineers < ActiveRecord::Migration[5.0]
  def change
    create_table :engineers do |t|
      t.references :user, foreign_key: true
      t.text :profile

      t.timestamps
    end
  end
end

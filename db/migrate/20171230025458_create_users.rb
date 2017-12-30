class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :regtype, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

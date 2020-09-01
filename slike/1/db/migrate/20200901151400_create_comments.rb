class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user
      t.text :comment
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
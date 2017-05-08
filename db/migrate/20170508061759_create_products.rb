class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :business, foreign_key: true
      t.attachment :avatar
      t.timestamps
    end
  end
end

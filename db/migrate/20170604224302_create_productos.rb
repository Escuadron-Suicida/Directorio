class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :stock
      t.text :descripcion
      t.string :categoria
      t.integer :precio_compra
      t.integer :precio_venta
      t.attachment :avatar
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end

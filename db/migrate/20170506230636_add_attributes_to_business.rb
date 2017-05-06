class AddAttributesToBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :rut, :string
    add_column :businesses, :legal_name, :string
    add_column :businesses, :agent_name, :string
    add_column :businesses, :agent_rut, :string
    add_column :businesses, :phone, :string
    add_column :businesses, :contact_name, :string
    add_column :businesses, :contact_phone, :string
    add_column :businesses, :address, :string
  end
end

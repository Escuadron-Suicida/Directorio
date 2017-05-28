class AddAdminToBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :admin, :boolean, default: false
  end
end

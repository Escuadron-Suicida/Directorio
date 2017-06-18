class AddSeentoMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :seen, :boolean, default: true
  end
end

class AddCheckToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :check, :boolean, null: false, default: false
  end
end

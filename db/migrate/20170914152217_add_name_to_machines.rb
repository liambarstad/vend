class AddNameToMachines < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :name, :string
  end
end

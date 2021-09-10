class AddRolToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rol, :string
  end
end

class AddEmailToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :email, :string
  end
end

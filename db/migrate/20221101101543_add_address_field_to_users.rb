class AddAddressFieldToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :address, :string, after: :gender
  end

  def down
    remove_column :users, :address
  end
end

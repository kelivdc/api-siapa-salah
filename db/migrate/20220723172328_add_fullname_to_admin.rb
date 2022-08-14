class AddFullnameToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :fullname, :string
    add_column :admins, :active, :boolean
  end
end

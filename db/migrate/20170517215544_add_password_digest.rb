class AddPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    add_column :proveedores, :password_digest, :string
  end
end

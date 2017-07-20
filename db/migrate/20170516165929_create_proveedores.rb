class CreateProveedores < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedores do |t|
      t.string :rfc
      t.string :password
      t.string :razon_social
      t.timestamps
    end
  end
end

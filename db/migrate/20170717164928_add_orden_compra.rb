class AddOrdenCompra < ActiveRecord::Migration[5.0]
  def change
    add_column :documentos, :orden_compra, :string
  end
end

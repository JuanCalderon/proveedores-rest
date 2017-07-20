class AddProveedorToDocumentos < ActiveRecord::Migration[5.0]
  def change
    add_reference :documentos, :proveedor
  end
end

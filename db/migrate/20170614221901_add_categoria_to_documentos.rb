class AddCategoriaToDocumentos < ActiveRecord::Migration[5.0]
  def change
    add_reference :documentos, :categoria
  end
end

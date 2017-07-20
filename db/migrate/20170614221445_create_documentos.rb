class CreateDocumentos < ActiveRecord::Migration[5.0]
  def change
    create_table :documentos do |t|
        t.string :attachment
        t.timestamps
    end
  end
end

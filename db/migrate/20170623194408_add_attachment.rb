class AddAttachment < ActiveRecord::Migration[5.0]
  def change
    add_column :documentos, :attachment, :string
  end
end

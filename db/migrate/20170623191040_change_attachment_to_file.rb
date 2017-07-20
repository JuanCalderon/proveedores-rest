class ChangeAttachmentToFile < ActiveRecord::Migration[5.0]
  def change
    rename_column :documentos, :attachment, :file
  end
end

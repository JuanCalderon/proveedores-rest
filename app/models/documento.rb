class Documento < ApplicationRecord

  mount_uploader :attachment, DocumentoUploader # Tells rails to use this uploader for this model.

  belongs_to :proveedor
  #belongs_to :Categoria

end
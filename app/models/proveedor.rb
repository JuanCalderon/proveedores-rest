class Proveedor < ApplicationRecord

  has_secure_password

  has_many :documentos, -> { order(:categoria_id, :updated_at) }

end
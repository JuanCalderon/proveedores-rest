class AuthenticateProveedor

  prepend SimpleCommand

  def initialize(rfc, password)
    @rfc = rfc
    @password = password
  end

  def call
    JsonWebToken.encode(proveedor_id: proveedor.id) if proveedor
  end

  private

  attr_accessor :rfc, :password, :razon_social

  def proveedor

    proveedor = Proveedor.find_by_rfc(rfc)
    return proveedor if proveedor && proveedor.authenticate(password)

    errors.add :proveedor_authentication, 'invalid credentials'
    nil
  end

end

=begin
rails c
pass =  BCrypt::Password.create('Verb1tim')
 => "$2a$10$.eFta7QufmVZpkt6jWz3fu4eXPeCC.E2uPJ8e20TitXFv7pw6wPqG"
=end
class ApplicationController < ActionController::API

  before_action :authenticate_request
    attr_reader :current_proveedor

    private

    def authenticate_request
      if !request.fullpath.include? '/documentos'
        @current_proveedor = AuthorizeApiRequest.call(request.headers).result
        render json: {error: '---Not Authorized---'}, status: 401 unless @current_proveedor
      end
    end

end

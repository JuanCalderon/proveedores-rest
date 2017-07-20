Rails.application.routes.draw do

  resources :proveedores
  resources :categorias
  resources :documentos

  post '/authenticate', to: 'authentication#authenticate'

  get '/proveedores/by_rfc/:rfc', to: 'proveedores#by_rfc'
  get '/proveedores/by_rfc2/:rfc', to: 'proveedores#by_rfc2'
  get '/documentos/by_proveedor_id/:proveedor_id', to: 'documentos#by_proveedor_id'
  get '/documentos/download/:id', to: 'documentos#download'

end

Corruptos::Application.routes.draw do
  resources :votos_urnas

  resources :candidaturas

  resources :coligacao_partidos

  resources :coligacaos

  resources :cargo_eleicaos

  resources :partidos

  resources :partidos do
    collection { post :search, to: 'partidos#index' }
  end

  resources :candidatos
  match 'candidatos/carrega_dados/:cpf', :to => 'candidatos#carrega_dados'

  resources :cargos

  resources :eleicaos

  resources :secaos

  resources :zonas
  match 'zonas/busca_secoes/:id', :to => 'zonas#busca_secoes'

  resources :titulos

  resources :eleitors

  resources :enderecos
  match 'enderecos/busca_cep/:cep', :to => 'enderecos#busca_cep'

  resources :municipios

  resources :ufs
  match 'ufs/busca_municipios/:uf', :to => 'ufs#busca_municipios'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
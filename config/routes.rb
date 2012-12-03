Corruptos::Application.routes.draw do
  get "relatorios/index"
  match 'relatorios/candidato', to: 'relatorios#candidato'
  match 'relatorios/zona', to: 'relatorios#zona'
  match 'relatorios/secao', to: 'relatorios#secao'
  match 'relatorios/municipio', to: 'relatorios#municipio'
  match 'relatorios' => 'relatorios#index'

  resources :votos_urnas

  resources :candidaturas

  resources :coligacao_partidos

  resources :coligacaos

  resources :cargo_eleicaos

  resources :partidos
  match 'partidos/busca_partidos/', to: 'partidos#busca_partidos'

  resources :partidos do
    collection { post :search, to: 'partidos#index' }
  end

  resources :candidatos
  match 'candidatos/carrega_dados/:cpf', to: 'candidatos#carrega_dados'

  resources :cargos

  resources :eleicaos

  resources :secaos

  resources :zonas
  match 'zonas/busca_secoes/:id', to: 'zonas#busca_secoes'

  resources :titulos

  resources :eleitors

  resources :enderecos
  match 'enderecos/busca_cep/:cep', to: 'enderecos#busca_cep'

  resources :municipios
  match 'municipios/busca_zonas/:municipio', to: 'municipios#busca_zonas'

  resources :ufs
  match 'ufs/busca_municipios/:uf', to: 'ufs#busca_municipios'

  authenticated :user do
    root to: 'home#index'
  end
  root to: "home#index"
  devise_for :users
  resources :users
end
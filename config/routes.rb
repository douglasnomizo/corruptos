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

  resources :titulos

  resources :eleitors

  resources :enderecos

  resources :municipios

  resources :ufs

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
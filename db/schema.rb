# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102133124) do

  create_table "candidatos", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "nome_campanha"
    t.integer  "eleitor_id"
  end

  add_index "candidatos", ["eleitor_id"], :name => "index_candidatos_on_eleitor_id"

  create_table "candidaturas", :force => true do |t|
    t.integer  "candidato_id"
    t.integer  "cargo_eleicao_id"
    t.integer  "partido_id"
    t.integer  "codigo_candidato"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "candidaturas", ["candidato_id"], :name => "index_candidaturas_on_candidato_id"
  add_index "candidaturas", ["cargo_eleicao_id"], :name => "index_candidaturas_on_cargo_eleicao_id"
  add_index "candidaturas", ["partido_id"], :name => "index_candidaturas_on_partido_id"

  create_table "cargo_eleicaos", :force => true do |t|
    t.integer  "cargo_id"
    t.integer  "eleicao_id"
    t.integer  "municipio_id"
    t.integer  "uf_id"
    t.integer  "vagas"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cargo_eleicaos", ["cargo_id"], :name => "index_cargo_eleicaos_on_cargo_id"
  add_index "cargo_eleicaos", ["eleicao_id"], :name => "index_cargo_eleicaos_on_eleicao_id"
  add_index "cargo_eleicaos", ["municipio_id"], :name => "index_cargo_eleicaos_on_municipio_id"
  add_index "cargo_eleicaos", ["uf_id"], :name => "index_cargo_eleicaos_on_uf_id"

  create_table "cargos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coligacao_partidos", :force => true do |t|
    t.integer  "coligacao_id"
    t.integer  "partido_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "coligacao_partidos", ["coligacao_id"], :name => "index_coligacao_partidos_on_coligacao_id"
  add_index "coligacao_partidos", ["partido_id"], :name => "index_coligacao_partidos_on_partido_id"

  create_table "coligacaos", :force => true do |t|
    t.integer  "cargo_eleicao_id"
    t.string   "nome"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "coligacaos", ["cargo_eleicao_id"], :name => "index_coligacaos_on_cargo_eleicao_id"

  create_table "eleicaos", :force => true do |t|
    t.integer  "ano"
    t.boolean  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "eleitors", :force => true do |t|
    t.string   "nome"
    t.string   "nome_mae"
    t.string   "rg"
    t.date     "data_nascimento"
    t.string   "cpf"
    t.integer  "endereco_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "eleitors", ["endereco_id"], :name => "index_eleitors_on_endereco_id"

  create_table "enderecos", :force => true do |t|
    t.integer  "municipio_id"
    t.string   "logradouro"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cep"
    t.string   "complemento"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "tipo_logradouro"
  end

  add_index "enderecos", ["municipio_id"], :name => "index_enderecos_on_municipio_id"

  create_table "municipios", :force => true do |t|
    t.integer  "uf_id"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "municipios", ["uf_id"], :name => "index_municipios_on_uf_id"

  create_table "partidos", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "numero"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "secaos", :force => true do |t|
    t.integer  "limite_eleitores"
    t.integer  "zona_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "codigo"
  end

  add_index "secaos", ["zona_id"], :name => "index_secaos_on_zona_id"

  create_table "titulos", :force => true do |t|
    t.date     "data_emissao"
    t.string   "juiz_eleitoral"
    t.boolean  "status"
    t.integer  "eleitor_id"
    t.integer  "secao_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "titulos", ["eleitor_id"], :name => "index_titulos_on_eleitor_id"
  add_index "titulos", ["secao_id"], :name => "index_titulos_on_secao_id"

  create_table "ufs", :force => true do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "votos_urnas", :force => true do |t|
    t.integer  "secao_id"
    t.integer  "candidatura_id"
    t.integer  "qtd_votos"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "votos_urnas", ["candidatura_id"], :name => "index_votos_urnas_on_candidatura_id"
  add_index "votos_urnas", ["secao_id"], :name => "index_votos_urnas_on_secao_id"

  create_table "zonas", :force => true do |t|
    t.integer  "endereco_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "descricao"
  end

  add_index "zonas", ["endereco_id"], :name => "index_zonas_on_endereco_id"

end

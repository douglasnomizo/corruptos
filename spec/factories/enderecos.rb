# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :endereco do
    municipio nil
    logradouro "MyString"
    numero 1
    bairro "MyString"
    cep "MyString"
    complemento "MyString"
  end
end

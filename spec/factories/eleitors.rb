# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eleitor do
    nome "MyString"
    nome_mae "MyString"
    rg "MyString"
    data_nascimento "2012-10-30"
    cpf "MyString"
    endereco nil
  end
end

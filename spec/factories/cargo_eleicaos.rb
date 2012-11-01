# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cargo_eleicao do
    cargo nil
    eleicao nil
    municipio nil
    uf nil
    vagas 1
  end
end

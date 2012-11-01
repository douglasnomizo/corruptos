# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidatura do
    candidato nil
    cargo_eleicao nil
    partido nil
    codigo_candidato 1
  end
end

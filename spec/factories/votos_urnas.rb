# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :votos_urna do
    secao nil
    candidatura nil
    qtd_votos 1
  end
end

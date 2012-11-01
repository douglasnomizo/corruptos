# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :titulo do
    data_emissao "2012-10-30"
    juiz_eleitoral "MyString"
    status false
    eleitor nil
    secao nil
  end
end

class ProvinceSerializer < ActiveModel::Serializer
  has_many :cities
  
  attributes :name
end

class VehicleKind < ApplicationRecord
  extend Enumerize
  has_many :posts
  
  enumerize :name, in: %i[oto moto bike other], scope: true
end

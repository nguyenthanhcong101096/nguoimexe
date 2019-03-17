# frozen_string_literal: true

read_json_moto = JSON.parse(File.read('moto_brand.json'))
read_json_moto.each do |bra|
  brand_moto = FactoryBot.create(:brand, name: bra[1]['name'], vehicle_kind_id: 1)

  bra[1]['mode'].each do |mod|
    FactoryBot.create(:vehicle_model, brand: brand_moto, name: mod[1])
  end
end


read_json_oto = JSON.parse(File.read('oto_brand.json'))
read_json_oto.each do |bra|
  brand_oto = FactoryBot.create(:brand, name: bra[1]['name'], vehicle_kind_id: 2)

  bra[1]['mode'].each do |mod|
    FactoryBot.create(:vehicle_model, brand: brand_oto, name: mod[1])
  end
end


read_json_bike = JSON.parse(File.read('bike_brand.json'))
read_json_bike.each do |bra|
  brand_bike = FactoryBot.create(:brand, name: bra[1]['name'], vehicle_kind_id: 3)

  bra[1]['mode'].each do |mod|
    FactoryBot.create(:vehicle_model, brand: brand_bike, name: mod[1])
  end
end

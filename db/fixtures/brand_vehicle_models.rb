# frozen_string_literal: true

read_json = JSON.parse(File.read('moto_brand.json'))

read_json.each do |bra|
  brand_moto = FactoryBot.create(:brand, name: bra[1]['name'], vehicle_kind_id: 1)

  bra[1]['mode'].each do |mod|
    FactoryBot.create(:vehicle_model, brand: brand_moto, name: mod[1])
  end
end

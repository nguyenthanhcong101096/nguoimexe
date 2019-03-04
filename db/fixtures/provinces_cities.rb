# frozen_string_literal: true

read_json = JSON.parse(File.read('database_provinces.json'))

read_json.each do |pro|
  province = FactoryBot.create(:province, name: pro[1]['name'])

  pro[1]['cities'].each do |city|
    FactoryBot.create(:city, province: province, name: city[1])
  end
end

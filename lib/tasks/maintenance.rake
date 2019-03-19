namespace :maintenance do
  desc "Enable mode maintenance website"
  task enable: :environment do
    Settings.maintenance = 'false'
  end
end

namespace :db do
  desc "Testing populator"
  task :populate => :environment do
    require "populator"
    require "faker"

    # User.populate 3 do |user|
    #    name = Faker::Internet.user_name
    #    user.name = name
    #    user.cached_slug = name
    #    user.email = Faker::Internet.email
    #    user.created_at = 4.years.ago..Time.now
    # end

    Shoe.populate 3 do |shoe|
      shoe.name = "name"
      shoe.season = 1
      shoe.element = "whatever"
      shoe.style = "ugly"
      shoe.color = "green"
      shoe.user_id = 16
    end
    Shoe.all.each { |shoe| shoe.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); shoe.save! }

    Garment.populate 3 do |garment|
      garment.name = "name"
      garment.season = 1
      garment.element = "whatever"
      garment.style = "ugly"
      garment.color = "green"
      garment.user_id = 16
    end

    Garment.all.each { |garment| garment.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); garment.save! }

    Accessory.populate 3 do |accessory|
      accessory.name = "name"
      accessory.season = 1
      accessory.element = "whatever"
      accessory.style = "ugly"
      accessory.color = "green"
      accessory.user_id = 16
    end

    Accessory.all.each { |accessory| accessory.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); accessory.save! }
end

end
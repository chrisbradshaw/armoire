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
      shoe.user_id = User.pluck(:id).sample
    end
    Shoe.all.each { |shoe| shoe.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); shoe.save! }

    Garment.populate 3 do |garment|
      garment.name = "name"
      garment.season = 1
      garment.element = "whatever"
      garment.style = "ugly"
      garment.color = "green"
      garment.user_id = User.pluck(:id).sample
    end

    Garment.all.each { |garment| garment.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); garment.save! }

    Accessory.populate 3 do |accessory|
      accessory.name = "name"
      accessory.season = 1
      accessory.element = "whatever"
      accessory.style = "ugly"
      accessory.color = "green"
      accessory.user_id = User.pluck(:id).sample
    end

    Accessory.all.each { |accessory| accessory.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); accessory.save! }

  Outfit.populate 3 do |outfit|
    outfit.accessory_id = Accessory.pluck(:id).sample
    outfit.shoe_id = Shoe.pluck(:id).sample
    outfit.garment_id = Garment.pluck(:id).sample
    outfit.user_id = 16
    outfit.name = "#{Random.rand(100)}-Outfit"
    outfit.action = 1
  end 
end
end
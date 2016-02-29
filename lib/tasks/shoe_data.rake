namespace :db do
  desc 'Testing populator'
  task populate: :environment do
    require 'populator'
    require 'faker'

    # User.populate 3 do |user|
    #   user.name = Faker::Company.name
    #   user.name = Faker::Name.name
    #   user.email = Faker::Internet.email
    #   user.created_at = 4.years.ago..Time.now
    #   user.encrypted_password = Faker::Internet.password
    #   user.latitude = Faker::Address.latitude
    #   user.longitude = Faker::Address.longitude
    #   user.sign_in_count = 1
    #   user.failed_attempts = 0
    # end

    User.pluck(:id).each do |user_id|
      Shoe.populate 3 do |shoe|
        shoe.name = "name"
        shoe.season = 0
        shoe.element = Faker::Commerce.department
        shoe.style = "classic"
        shoe.color = "blue"
        shoe.user_id = user_id
      end

       Shoe.populate 3 do |shoe|
        shoe.name = "name"
        shoe.season = 2
        shoe.element = Faker::Commerce.department
        shoe.style = "classic"
        shoe.color = "blue"
        shoe.user_id = user_id
      end

       Shoe.populate 3 do |shoe|
        shoe.name = "name"
        shoe.season = 3
        shoe.element = Faker::Commerce.department
        shoe.style = "classic"
        shoe.color = "blue"
        shoe.user_id = user_id
      end

    Shoe.populate 3 do |shoe|
        shoe.name = "name"
        shoe.season = 1
        shoe.element = Faker::Commerce.department
        shoe.style = "classic"
        shoe.color = "blue"
        shoe.user_id = user_id
      end

      Garment.populate 3 do |garment|
        garment.name = "name"
        garment.season = 0
        garment.element = Faker::Commerce.department
        garment.style = "classic"
        garment.color = "blue"
        garment.user_id = user_id
      end

    Garment.populate 3 do |garment|
        garment.name = "name"
        garment.season = 1
        garment.element = Faker::Commerce.department
        garment.style = "classic"
        garment.color = "blue"
        garment.user_id = user_id
      end


    Garment.populate 3 do |garment|
        garment.name = "name"
        garment.season = 2
        garment.element = Faker::Commerce.department
        garment.style = "classic"
        garment.color = "blue"
        garment.user_id = user_id
      end


    Garment.populate 3 do |garment|
        garment.name = "name"
        garment.season = 3
        garment.element = Faker::Commerce.department
        garment.style = "classic"
        garment.color = "blue"
        garment.user_id = user_id
      end


      Accessory.populate 3 do |accessory|
        accessory.name = "name"
        accessory.season = 0
        accessory.element = Faker::Commerce.department
        accessory.style = "classic"
        accessory.color = "blue"
        accessory.user_id = user_id
      end

      Accessory.populate 3 do |accessory|
        accessory.name = "name"
        accessory.season = 1
        accessory.element = Faker::Commerce.department
        accessory.style = "classic"
        accessory.color = "blue"
        accessory.user_id = user_id
      end

      Accessory.populate 3 do |accessory|
        accessory.name = "name"
        accessory.season = 2
        accessory.element = Faker::Commerce.department
        accessory.style = "classic"
        accessory.color = "blue"
        accessory.user_id = user_id
      end

      Accessory.populate 3 do |accessory|
        accessory.name = "name"
        accessory.season = 3
        accessory.element = Faker::Commerce.department
        accessory.style = "classic"
        accessory.color = "blue"
        accessory.user_id = user_id
      end

      Outfit.populate 3 do |outfit|
        outfit.user_id = user_id
        outfit.garment_id = Garment.where(user_id: user_id).pluck(:id).sample
        outfit.shoe_id = Shoe.where(user_id: user_id).pluck(:id).sample
        outfit.accessory_id = Accessory.where(user_id: user_id).pluck(:id).sample
        outfit.action = 1
        outfit.name = Faker::Name.name
      end
    end

    Shoe.all.each { |shoe| shoe.image = File.open(Dir.glob(File.join(Rails.root, 'sample_shoes', '*')).sample); shoe.save! }
    Garment.all.each { |garment| garment.image = File.open(Dir.glob(File.join(Rails.root, 'sample_garments', '*')).sample); garment.save! }
    Accessory.all.each { |accessory| accessory.image = File.open(Dir.glob(File.join(Rails.root, 'sample_accessories', '*')).sample); accessory.save! }

  end
end


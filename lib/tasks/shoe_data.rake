namespace :db do
  desc 'Testing populator'
  task populate: :environment do
    require 'populator'
    require 'faker'

    User.populate 3 do |user|
      user.name = Faker::Company.name
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.created_at = 4.years.ago..Time.now
      user.encrypted_password = Faker::Internet.password
      user.latitude = Faker::Address.latitude
      user.longitude = Faker::Address.longitude
      user.sign_in_count = 1
      user.failed_attempts = 0
    end

    #     Shoe.populate 3 do |shoe|
    #       shoe.name = "name"
    #       shoe.season = 1
    #       shoe.element = Faker::Commerce.department
    #       shoe.style = "ugly"
    #       shoe.color = Faker::Color.color_name
    #       shoe.user_id = User.all.pluck(:id).sample
    #     end
    #     Shoe.all.each { |shoe| shoe.image = File.open(Dir.glob(File.join(Rails.root, 'sample_shoes', '*')).sample); shoe.save! }

    #     Garment.populate 3 do |garment|
    #       garment.name = "name"
    #       garment.season = 1
    #       garment.element = Faker::Commerce.department
    #       garment.style = "ugly"
    #       garment.color = Faker::Color.color_name
    #       garment.user_id = User.all.pluck(:id).sample
    #     end

    #     Garment.all.each { |garment| garment.image = File.open(Dir.glob(File.join(Rails.root, 'sample_garments', '*')).sample); garment.save! }

    #     Accessory.populate 3 do |accessory|
    #       accessory.name = "name"
    #       accessory.season = 1
    #       accessory.element = Faker::Commerce.department
    #       accessory.style = "ugly"
    #       accessory.color = Faker::Color.color_name
    #       accessory.user_id = User.all.pluck(:id).sample
    #     end

    #     Accessory.all.each { |accessory| accessory.image = File.open(Dir.glob(File.join(Rails.root, 'sample_accessories', '*')).sample); accessory.save! }
    # end
  end
end

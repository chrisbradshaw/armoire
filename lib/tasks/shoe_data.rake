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
         user_id = User.pluck(:id).sample
      end
      Shoe.all.each { |shoe| shoe.image = File.open(Dir.glob(File.join(Rails.root, 'sample_images', '*')).sample); shoe.save! }
   end
end
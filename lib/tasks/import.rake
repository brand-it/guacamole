namespace :images do
  
  require 'action_controller'
  require 'action_controller/test_process.rb'
  require 'find'
  desc "Imports all the images into the database as well as formats the for your use."
  task :import => :environment do
    cards = Array.new
    Card.find(:all).map do |t|
      cards << ["#{t.name}"]
    end
    
    cards << [""]
    Find.find('public/images/import_cards') do |path|
      duplicate = 1
      if !FileTest.directory?(path)
        unless path == "public/images/.DS_Store"
          if path =~ /.jpg/
            path_gsub = path.gsub('public/images/import_cards/', "").gsub("_", " ").gsub(".jpg", "")
            for card_name in cards
              if card_name.to_s == path_gsub
                duplicate = 0
                puts "You have already added #{path_gsub}"
              end
            end
            
            if duplicate == 1
              puts "Adding #{path}"
              image = Image.new(:uploaded_data => ActionController::TestUploadedFile.new(path, 'image/jpeg'))
              image.save!
              card = Card.new(:name => path_gsub, :image_id => image.id)
              card.save!
            end
          end
        end
      end
    end
  end
end
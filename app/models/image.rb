class Image < ActiveRecord::Base
  has_many :cards
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 20.megabyte,
                 :resize_to => 'x700',
                 :partition => false,
                 :path_prefix => 'public/images/cards',
                 :thumbnails => { :thumb => "50x", 
                               :small => "200x" }     

                 validates_as_attachment 


  def self.images
    find(:all, :conditions => ["filename NOT LIKE ? AND filename NOT LIKE ?", "%small%", "%thumb%"]).map do |i| 
      [ i.filename.gsub(".jpg", "").gsub("_", " "), i.id, ]
    end
  end

end
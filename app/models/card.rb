class Card < ActiveRecord::Base
  validates_presence_of :name
  belongs_to  :image
  
  has_many    :manas
  
  define_index do
    indexes :name, :sortable => true
    indexes ablity
    indexes flavor_text
    indexes kind
    #has manas(:card_id), :as => :card_ids
  end
  
  
  
  def mana(color)
    if color == "green"
      return "public/images/mana/green.gif"
    end
      
  end
  
end

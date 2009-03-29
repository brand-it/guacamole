class Mana < ActiveRecord::Base
  
  belongs_to :card
  
  
  define_index do
    indexes color
    indexes colorless
    indexes card_id
  end
  
  
  
  
end

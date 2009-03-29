# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  
  def colors
    return ["", 0],["White", 1],["Blue", 2],["Red", 3],["Green", 4],["Black", 5],["Colorless", 6]
  end
  
  def numbers
    
    perm = Permutation.new(7)
    array = Array.new
    
    array << ["X", nil]
    
    for value in perm.value
      array << [value]
    end
    
    return array
  end
  
  def word_color_palette(number)
    if number == 1
      return "White"
    elsif number == 2
      return "Blue"
    elsif number == 4
      return "Red"
    elsif number == 8
      return "Green"
    elsif number == 16
      return "Black"
    elsif number == 32
      return "Colorless"
    end
  end
  
  def redcloth(text)
    unless text.nil?
      RedCloth.new(text).to_html
    end
  end
  
  def img_color_palette(number, cost)
    
    unless number == 32
      return image_tag("mana/#{number}.gif")
    else
      return image_tag("mana/#{number}#{cost}.gif")
    end
    
  end
  
  #This is for user access levels
  def admin?
    true if current_user and current_user.access_level == 10
  end
  
  def user?
    true if current_user and current_user.access_level >= 1
  end
  
end

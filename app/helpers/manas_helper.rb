module ManasHelper
  
    require 'permutation'
  
  def color_select
    perm = Permutation.new(64)
    array = Array.new
    
    answers = perm.value
    for answer in answers
      unless answer == 0
        array << [mana_reader(answer), answer]
      end
    end
    return array.sort
  end
  
  def mana_reader(number)
    array = [32, 16, 8, 4, 2, 1]
    temp_array = Array.new
    colors = Array.new
    for a in array
      if number >= a
        number = number - a
        temp_array << a 
      end
    end
    for temp in temp_array
      colors << word_color_palette(temp)
    end
    return colors.join("/")
  end
end

class IngCompiler

  def initialize
  end

  def turn_to_hash(scheduled_recipes)
    all_ing = []
    scheduled_recipes.each do |sr|
      all_ing << sr.recipe.ingredients
    end
    adding(all_ing)
  end

  def adding(array)
    arraynames = []
    arrayqty = []
    newhash = {}
    array.each do |ing_list|
      ing_list.each do |ing|
        if arraynames.include?(ing.name)
          i = arraynames.index(ing.name)
          unless ing.quantity.nil?
            if ing.quantity.split.count > 1
              arrayqty[i] = "#{arrayqty[i].split.first.to_i + ing.quantity.split.first.to_i} #{arrayqty[i].split.last}"
            else
              arrayqty[i] = (arrayqty[i].split.first.to_i + ing.quantity.split.first.to_i).to_s
            end
          end
        else
          arraynames << ing.name
          arrayqty << ing.quantity
        end
      end
    end
    arraynames.each_with_index do |name, i|
      newhash[name] = arrayqty[i]
    end
    newhash
  end


end

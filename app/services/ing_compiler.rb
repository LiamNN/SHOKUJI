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
        name = ing.name.downcase.pluralize
        qty = 0 if ing.quantity.nil?
        qty = ing.quantity.split.first.to_i if ing.quantity.present?
        measurement = ing.quantity.split.second if ing.quantity.present?
        measurement = 0 if ing.quantity.nil?
        if newhash[name]
          newhash[name][:qty] += qty
        else
          newhash[name] = {qty: qty, measurement: measurement}
        end
      end
    end
    newhash
  end


end

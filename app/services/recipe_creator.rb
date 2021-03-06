class RecipeCreator
  require 'nokogiri'
  require 'open-uri'

  def initialize
  end

  def scrape_recipes
    html_content = URI.open("https://www.kitchenstories.com/en/recipes").read
    doc = Nokogiri::HTML(html_content)
    array = []
    hrefs = doc.css(".archive-tile__name a").map { |anchor| anchor["href"] }
      hrefs.each do |link|
        array << link
      end

    data = array.map do |link|
      hash = {}
      hash[:ingredients] = ingredients(link)
      hash[:method] = method(link)
      hash[:details] = recipe_deets(link)
      hash
    end

    new_recipe(data)
  end

  def ingredients(link)
    recipe_html = URI.open("https://www.kitchenstories.com#{link}").read
    doc = Nokogiri::HTML(recipe_html)
    hash = {}
    doc.search(".ingredients__col-2").children.each_with_index do |e, i|
      qty = doc.search(".js-col-1").children[i]&.text
      hash[e.text] = qty
    end
    hash
  end

  def method(link)
    recipe_html = URI.open("https://www.kitchenstories.com#{link}").read
    doc = Nokogiri::HTML(recipe_html)
    hash = {}
    doc.search(".step .text").children.each_with_index do |e, i|
      step = i + 1
      hash[step] = e.text
    end
    hash
  end

  def recipe_deets(link)
    recipe_html = URI.open("https://www.kitchenstories.com#{link}").read
    doc = Nokogiri::HTML(recipe_html)
    hash = {}
    hash2 = {}
    hash[:name] = doc.search(".recipe-title").children.text
    hash[:time] = doc.search(".time-container").children.text
    doc.search(".recipe-nutrition__information").children.each do |nutr|
      a = nutr.children[0].text
      hash2[a] = nutr.children[2].text
    end
    hash[:macros] = hash2
    hash[:servings] = doc.search(".stepper-value").children.text.to_i
    if doc.search(".page-header__image").first
      hash[:photo] = doc.search(".page-header__image").first.attributes["src"].value
    end
    return hash
  end

  def new_recipe(array)
    array.each do |recipe|
      Recipe.create(name: recipe[:details][:name], time: recipe[:details][:time], user_id: 1, servings: recipe[:details][:servings], macros: recipe[:details][:macros], photo: recipe[:details][:photo])
      recipe[:method].values.each do |method|
        RecipeMethod.create(instructions: method, recipe: Recipe.last)
      end
      recipe[:ingredients].each do |ing|
        Ingredient.create(name: ing[0], quantity: ing[1]&.chop, recipe_id: Recipe.last[:id])
      end
    end
  end
end

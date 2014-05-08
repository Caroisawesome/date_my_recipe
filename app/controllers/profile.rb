get "/users/:username" do
	@user = User.find(session[:id])
  erb :profile
end

post '/recipes' do
  @user = User.find(session[:id])
  @food = Food.find_by_name(params[:name])
  if @food == nil
    @food = Food.create(params)
    @client = Client.new
    @recipes = @client.get_recipes(params[:name])
    @recipes.map! do |recipe|
      recipe_object = Recipe.create(
        :published_at => recipe["publisher"],
        :name => recipe["title"],
        :recipe_url => recipe["source_url"],
        :img_url => recipe["image_url"],
        :food_id => @food.id
        )
    end
  else
    @recipes = @food.recipes
  end
  erb :_recipes, :layout => false
end

post '/add/:recipe_id' do
  @cookbook = Cookbook.find_by_user_id(session[:id])
  @recipe = Recipe.find(params[:recipe_id])
  Eat.create(cookbook_id: @cookbook.id, recipe_id: @recipe.id)
  params[:recipe_id].to_json
end


post '/cookbook' do
  @cookbook = Cookbook.find_by_user_id(session[:id])
  p @cookbook.recipes
  erb :_cookbook, :layout => false
end

delete '/delete/:id' do
  @recipe = Eat.find_by_recipe_id(params[:id]).destroy
  params[:id].to_json
end

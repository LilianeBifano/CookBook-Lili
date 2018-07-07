class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end


    def new
        @recipe = Recipe.new()
        @cuisines = Cuisine.all
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @cuisines = Cuisine.all
        @recipe.save
        render "show"
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
    end
end
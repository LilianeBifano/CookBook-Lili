class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end


    def new
        @recipe = Recipe.new()
        @cuisines = Cuisine.all
    end

    def create
        @cuisines = Cuisine.all
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            flash[:notice] = 'Receita cadastrada com sucesso'
            redirect_to recipe_path(@recipe)
        else
            flash[:alert] = 'Não foi possível cadastrar a receita'
            render 'new'
        end
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
    end
end
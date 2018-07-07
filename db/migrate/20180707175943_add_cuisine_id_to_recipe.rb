class AddCuisineIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cuisine_id, :string
  end
end

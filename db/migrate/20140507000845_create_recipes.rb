class CreateRecipes < ActiveRecord::Migration
  def change
  	create_table :recipes do |t|
      t.belongs_to :food
  		t.string :name
      t.string :recipe_url
      t.string :img_url
      t.string :published_at
      t.timestamps
    end
  end
end

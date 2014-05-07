class CreateEats < ActiveRecord::Migration
  def change
  	create_table :eats do |t|
  		t.belongs_to :cookbook
  		t.belongs_to :recipe
  		t.timestamps
  	end
  end
end

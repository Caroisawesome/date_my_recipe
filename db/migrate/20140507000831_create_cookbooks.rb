class CreateCookbooks < ActiveRecord::Migration
  def change
  	create_table :cookbooks do |t|
      t.belongs_to :user
  		t.string :title
      t.timestamps
    end
  end
end

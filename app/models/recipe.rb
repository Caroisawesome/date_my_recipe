class Recipe < ActiveRecord::Base
	has_many :eats
	has_many :cookbooks, :through => :eats
end
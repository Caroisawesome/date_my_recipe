class Cookbook < ActiveRecord::Base
	has_many :eats
	has_many :recipes, :through => :eats
	belongs_to :user
end
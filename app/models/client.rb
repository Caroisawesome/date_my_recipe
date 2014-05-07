class Client
    include HTTParty
    base_uri 'http://food2fork.com/api'

    def initialize
      #Ahhh, I am going to steal your auth key, so is everyone else on github. Use a dotenv or yaml file with .gitignore
      @auth_key = "e99198f1d353caed26a1b5290fb7e430"
      # @auth_key = ENV['FOOD2FORK_API_KEY']
    end

    def get_recipes(ingredient)
      #Nice use the opetions var!
      options = { :query => {key: @auth_key, q: ingredient} }
      response = self.class.get('/search', options)
      parse_recipes(response.body)
    end

    def parse_recipes(response)
      recipes = JSON.parse(response)
      return recipes["recipes"]
    end
end



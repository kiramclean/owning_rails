# Everything in ruby is an object -> you can call methods on anything
# You can send methods dynamically using .send(:name)
# You can write anything you want in the body of a class -> to write a class method, use self.
# extend adds class level methods
# include adds instance level methods
# Procs are objects used to wrap blocks so you can access them
# Lambda checks arguments passed to it, can check the number of arguments, procs don't
# Lambda returns on 'return', Procs return on 'return' from the enclosing method
# yield keyworkd executes a block passed to a method
#
# ACTIVE RECORD
# Each table in the DB should correspond to a class in your app

class Router
  def initialize
    @routes = {}
  end

  def match(route)
    @routes.update route
  end

  def routes(&block)
    instance_eval(&block)
    p @routes
  end
end

Router.new.instance_eval { p @routes }

Router.new.routes do
  match '/users' => 'users#index'
  match '/login' => 'sessions#new'
end

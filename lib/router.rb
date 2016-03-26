class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block)
  end

  def match(route)
    @routes.update route
  end

  def recognize(path)
    @routes[path].split('#')
  end
end

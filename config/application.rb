require 'action_controller'
require_relative '../lib/router'
require_relative './routes'
require_relative '../app/controllers/application_controller'

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process action_name

    response.finish
  end

  def route(path)
    # _, controller_name, action_name = path.split('/')
    # [controller_name || 'home', action_name || 'index']
    Routes.recognize(path)
  end

  def load_controller_class(name)
    require_relative "../app/controllers/#{name}_controller" # Do not do this in production on thread-based servers!
    Object.const_get name.capitalize + 'Controller'
  end
end

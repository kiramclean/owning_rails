require 'filtering'
require 'rendering'

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action_name)
      send action_name
    end
  end

  class Base < Metal
    include Filtering
    include Rendering
  end
end

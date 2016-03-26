ROUTES = {
  'GET' => {
    # 'path' => block
  }
}

def get(path, &block)
  ROUTES['GET'][path] = block
end

get '/' do
  'awesome!'
end

get '/yessir' do
  'this is super cool'
end

run -> env do
  method = env['REQUEST_METHOD']
  path = env['PATH_INFO']

  if block = ROUTES[method][path]
    body = block.call
    [200, {}, [body]]
  else
    [404, {}, ['Not found']]
  end
end

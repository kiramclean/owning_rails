require ::File.expand_path('../lib/boot', __FILE__)
require_relative './config/application'

run Application.new

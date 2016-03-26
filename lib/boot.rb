# Boot the framework

# Activate Bundler to load the Gemfile
require 'bundler/setup'

# Add framework (in lib/) to the load path
$LOAD_PATH.unshift 'lib'

# Add current directory to load path
$LOAD_PATH.unshift '.'

# Add all app files to load path
Dir['app/*'].each do |path|
  $LOAD_PATH << path
end

require 'bundler/setup'

$LOAD_PATH.unshift File.dirname File.expand_path __FILE__

require 'scorched'
require 'opal'

class App < Scorched::Controller
  get '/' do
    render :index, engine: :erb
  end

  get '/app.js' do
    Opal.compile <<-JS
      puts 'Hello world!'
    JS
  end

  get '/opal.js' do
    Opal::Builder.build('opal')
  end
end

run App

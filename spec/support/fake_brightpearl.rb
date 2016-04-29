require 'sinatra/base'

# FakeBrightpearl
class FakeBrightpearl < Sinatra::Base
  get '/public-api/:account/contact-service/contact/:id' do
    # https://www.brightpearl.com/developer/latest/contact/contact/get.html#example1
    json_response 200, 'contact.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end

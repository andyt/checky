require 'checky'
Checky.configure

use Rack::Auth::Basic, "Restricted area" do |username, password|
  [username, password] == ['checky', 'chocky']
end

run Checky::App
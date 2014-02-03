# Checky

Checky is a Rack app that provides simple health check monitoring of the server it is running on.

There's currently only one test: that a TCP port is available.

The code is designed to make it simple to add new tests, and I may indeed do just that, as I need them.


## Why?

I needed a page that I could test with Pingdom to see if I had outbound connectivity.


## Installation

Clone this repo, and run it with Rackup. Add new tests in lib/checky/checks. Configure them in config/checks.rb.

Or add it to your Gemfile and mount it on your Rack-based app.

It's current basic-auth'd with hardcoded credentials.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

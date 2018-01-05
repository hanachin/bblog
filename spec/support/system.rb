Capybara.register_driver :chrome_remote do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions:  { mobileEmulation: { deviceName: "Nexus 5X" } })
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: caps, url: 'http://chrome:4444/wd/hub')
end
Capybara.default_driver = :chrome_remote
Capybara.server_port = 3005
Capybara.server_host = '0.0.0.0'

RSpec.configure do |config|
  app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3005"
  config.before(type: :system) do
    Capybara.app_host = app_host
    driven_by(:chrome_remote)
  end
end

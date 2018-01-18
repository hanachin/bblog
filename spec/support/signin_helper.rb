RSpec.configure do |config|
  config.include Module.new {
    def signin(baby)
      code = create(:signin_code, baby: baby).code
      visit "/signin/#{code}"
    end
  }, type: :system
end

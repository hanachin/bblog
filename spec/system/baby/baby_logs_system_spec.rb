require 'rails_helper'

RSpec.describe 'Show baby logs', type: :system do
  def signin(baby)
    code = create(:signin_code, baby: baby).code
    visit "/signin/#{code}"
  end

  before do
    signin(create(:baby))
  end

  it 'shows baby logs' do
    visit '/baby/2017/1/1'
    expect(page).to have_text('👶')
  end
end

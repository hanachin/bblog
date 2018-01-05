require 'rails_helper'

RSpec.describe 'Show baby logs', type: :system do
  it 'shows baby logs' do
    visit '/baby/2017/1/1'
    expect(page).to have_text('👶')
  end
end

require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  def blur(name)
    page.execute_script(%{ document.querySelector('input[name="#{name}"]').blur() })
  end

  specify 'signup from form' do
    visit '/'

    expect(page).to have_no_content('登録用のURLを送りました。')

    fill_in 'email', with: 'test@example.com'
    blur('email')
    click_button '👶登録'
    expect(page).to have_content('登録用のURLを送りました。')
    expect(page).to have_no_button('👶登録')

    click_on '戻る'
    expect(page).to have_no_content('登録用のURLを送りました。')
    expect(page).to have_button('👶登録')
  end
end

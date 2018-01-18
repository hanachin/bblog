require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  def blur(name)
    page.execute_script(%{ document.querySelector('input[name="#{name}"]').blur() })
  end

  it 'signup from form' do
    visit '/'

    fill_in 'email', with: 'test@example.com'
    blur('email')
    click_button '👶登録'
    expect(page).to have_content('入力されたメールアドレスにURLを送りました。ご確認ください。 ')
    expect(page).to have_no_button('👶登録')

    mail = VerificationMailer.deliveries.detect { |m| m.to == ['test@example.com'] }
    url = mail.body.to_s[URI.regexp]
    visit url
    expect(page).to have_content('👶')
    expect(page).to have_content('🤱')
    expect(page).to have_content('🍼')
    expect(page).to have_content('💩')
    expect(page).to have_content('💧')
    expect(page).to have_content('🛀')
  end
end

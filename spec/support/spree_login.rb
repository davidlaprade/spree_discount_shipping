def login_spree(user)
  visit spree.login_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => 'secret'
  click_button 'Login'
  expect(page).to have_content("Logged in successfully")
end
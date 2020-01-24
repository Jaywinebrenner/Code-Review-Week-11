require 'rails_helper'
Product.destroy_all
Review.destroy_all
describe 'the product creation path as Admin', {:type => :feature} do
  it 'takes the user to the homepage where they can create a product' do
    visit '/'
    click_link('Sign up')
    fill_in('Email' , :with => 'admin@person.com')
    fill_in('user_password', :with => '123456')
    fill_in('user_password_confirmation', :with => '123456')
    choose('user_admin_true')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Create new product')
    click_link('Create new product')
    fill_in('Name' , :with => 'Rat Milk', )
    fill_in('Cost', :with => '100')
    fill_in('Country of origin', :with => 'USA')
    click_button('Create Product')
    expect(page).to have_content('Rat Milk')
  end
end

describe 'the product update path', {:type => :feature} do
  it 'allows a user to change the name of the product' do
    visit '/'
    click_link('Sign up')
    fill_in('Email' , :with => 'admin@person.com')
    fill_in('user_password', :with => '123456')
    fill_in('user_password_confirmation', :with => '123456')
    choose('user_admin_true')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Create new product')
    click_link('Create new product')
    fill_in('Name' , :with => 'Rat Milk', )
    fill_in('Cost', :with => '100')
    fill_in('Country of origin', :with => 'USA')
    click_button('Create Product')
    first(:link, 'Rat Milk').click
    click_link('Edit Product')
    fill_in('Name' , :with => 'Dog Milk')
    click_button('Update Product')
    expect(page).to have_content('Dog Milk')

  end
end

#
# describe 'the add a review path', {:type => :feature} do
#   it 'allows a user to add a review' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#     first(:link, 'Pig Poppers').click
#     click_link('Add a review')
#     fill_in('Author' , :with => 'Man Person')
#     fill_in('Content body', :with => 'I love this product, I am whole. I love this product, I am complete. I love this product, I have transcended. I love this product, I now know real meaning.')
#     fill_in('Rating', :with => '2')
#     click_button('Create Review')
#     expect(page).to have_content('Man Person')
#   end
# end
#
#
# describe 'the edit review path', {:type => :feature} do
#   it 'allows a user to edit a review' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#     first(:link, 'Pig Poppers').click
#     click_link('Add a review')
#     fill_in('Author' , :with => 'Man Person')
#     fill_in('Content body', :with => 'I love this product, I am whole. I love this product, I am complete. I love this product, I have transcended. I love this product, I now know real meaning.')
#     fill_in('Rating', :with => '2')
#     click_button('Create Review')
#     click_link('Man Person')
#     click_link('Edit review')
#     fill_in('Content body', :with => 'I like this product, I am whole. I like this product, I am complete. I like this product, I have transcended. I like this product, I now know real meaning.')
#     click_button('Update Review')
#     click_link('Man Person')
#     expect(page).to have_content('I like this product, I am whole. I like this product, I am complete. I like this product, I have transcended. I like this product, I now know real meaning.')
#   end
# end


# Javascript issues with accepting the alert
# describe 'the product delete path', {:type => :feature} do
#   it 'allows a user to delete a product' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#     first(:link, 'Pig Poppers').click
#     click_link('Delete product')
#     page.driver.browser.switch_to.alert.accept
#
#     expect(page).not_to have_content("Pig Poppers")
#   end
# end

Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
end
When(/^I click the View Details button for "(.*?)"$/) do |arg1|
  arg1 = '0'
  @browser.button(:value => 'View Details', :index => arg1.to_i).click
end

And(/^I click the Adopt Me button$/) do
  @browser.button(:value => 'Adopt Me!').click
  @cart = ShoppingCartPage.new(@browser)
end

And(/^I click the Complete the Adoption button$/) do
  @cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

When(/I complete the adoption using a Credit card$/) do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When(/^I complete the adoption$/) do
  on(CheckoutPage).checkout
end

And(/^I click the Adopt Another Puppy button$/) do
  @cart.continue_shopping
end

Then(/^I should see "(.*?)"$/) do |success_message|
  fail unless @browser.text.include? success_message
end

Then /^I should see "([^"]*)" as the name for line item (\d+)$/ do |name, line_item|
  @cart.name_for_line_item(line_item.to_i).should include name
end

When /^I should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal,line_item|
  @cart.subtotal_for_line_item(line_item.to_i).should == subtotal
end

When /^I should see "([^"]*)" as the cart total$/ do |total|
  @cart.cart_total.should == total
end
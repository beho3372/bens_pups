require 'rspec-expectations'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'fig_newton'

require_rel 'pages'

FigNewton.load('local.yml')
World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]],
}
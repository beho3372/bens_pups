class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:continue_shopping, :value => 'Adopt Another Puppy')
  button(:proceed_to_checkout, :value => 'Complete the Adoption')
  table(:cart, :index => 0)
  cell(:cart_total, :class => 'total_cell')


  def name_for_line_item(line_item)
    cart_line_item(line_item, NAME_COLUMN)
  end

  def subtotal_for_line_item(line_item)
    cart_line_item(line_item, SUBTOTAL_COLUMN)
  end

  private

  def cart_line_item(line_item, column)
    row = (line_item - 1) * LINES_PER_PUPPY
    cart_total[row][column].text
  end

end
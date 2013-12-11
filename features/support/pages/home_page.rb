require_relative 'side_menu_panel'

class HomePage
  include PageObject
  include SideMenuPanel

  page_url FigNewton.base_url

end
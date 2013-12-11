require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
end

After do |scenario|
  if scenario.failed?
    filename = "error-#{@current_page.class}-#{Time.now}.png"
    @current_page.save_screenshot(filename)
    embed(filename, 'image/png')
  end
  @browser.close
end
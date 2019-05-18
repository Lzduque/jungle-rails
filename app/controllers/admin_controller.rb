class AdminController < ApplicationController
  # http_basic_authenticate_with name: ENV['ADMIN_USER'].to_s, password: ENV['ADMIN_PASSWORD'].to_s
  # Bonus: Should ideally be implemented in an abstract top-level class for admin controllers (e.g., Admin::BaseController which the other concrete admin controllers inherit)

  def categories
  end
end

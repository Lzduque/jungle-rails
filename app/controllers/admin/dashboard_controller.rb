class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV[ADMIN_USER].to_s, password: ENV[ADMIN_PASSWORD].to_s

  def show
  end
end

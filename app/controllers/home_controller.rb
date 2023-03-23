class HomeController < ApplicationController
  def index
    @telegram_group = current_user.telegram_group
  end
end
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @telegram_group = current_user.telegram_group
  end
end
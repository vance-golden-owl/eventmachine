class TelegramGroupsController < ApplicationController
  before_action :authenticate_user!

  def show 
    
  end

  def new 
    @telegram_group = TelegramGroup.new
  end

  private 

  def prepare_telegram_group 
    @telegram_group = current_user.telegram_group
  end
end
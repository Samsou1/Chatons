class StaticController < ApplicationController
  before_action :authenticate_user!, only: %i[profile]
  def contact; end
  def about; end

  def profile
    @user = current_user
    puts @user
  end
end

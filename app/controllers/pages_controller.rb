class PagesController < ApplicationController
  def dashboard
    @full_name = "#{current_user.first_name} #{current_user.last_name}"
    @boats = current_user.boats
  end
end
